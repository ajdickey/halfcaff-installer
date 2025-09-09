#!/bin/zsh
set -euo pipefail
PKG_ID="${PKG_ID:-com.alexdickey.bluebook.addin}"
PKG_VERSION="${1:-0.2.0}"
: "${SIGN_ID:?set SIGN_ID to your exact Developer ID Installer name}"
PROFILE="${PROFILE:-AC_NOTARY}"
rm -rf pkgroot
mkdir -p pkgroot/Library/BluebookAddin
cp -f ./payload/manifest.xml pkgroot/Library/BluebookAddin/manifest.xml
pkgbuild --identifier "$PKG_ID" --version "$PKG_VERSION" --install-location "/" --scripts "scripts" --root "pkgroot" "BluebookAddin-$PKG_VERSION-unsigned.pkg"
productsign --sign "$SIGN_ID" "BluebookAddin-$PKG_VERSION-unsigned.pkg" "BluebookAddin-$PKG_VERSION.pkg"
xcrun notarytool submit "BluebookAddin-$PKG_VERSION.pkg" --keychain-profile "$PROFILE" --wait
xcrun stapler staple "BluebookAddin-$PKG_VERSION.pkg"
echo "Built BluebookAddin-$PKG_VERSION.pkg"
