#!/bin/zsh
set -euo pipefail
PKG_ID="com.alexdickey.bluebook.addin"
PKG_VERSION="${1:-0.1.0}"
rm -rf pkgroot
mkdir -p pkgroot/Library/BluebookAddin
cp -f ./payload/manifest.xml pkgroot/Library/BluebookAddin/manifest.xml
pkgbuild --identifier "$PKG_ID" --version "$PKG_VERSION" --install-location "/" --scripts "scripts" --root "pkgroot" "BluebookAddin-$PKG_VERSION-unsigned.pkg"
echo "Built BluebookAddin-$PKG_VERSION-unsigned.pkg"
