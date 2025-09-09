#!/bin/zsh
set -euo pipefail
PKG="${1:-BluebookAddin-0.1.0-unsigned.pkg}"
sudo installer -pkg "$PKG" -target /
