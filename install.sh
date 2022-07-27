#!/bin/bash

INSTALL_PATH="$HOME"
REPO_PATH="$(realpath "$0")"

cp -r "$REPO_PATH/dot-xinitrc"    "$INSTALL_PATH/.xinitrc"
cp -r "$REPO_PATH/dot-Xresources" "$INSTALL_PATH/.Xresources"
cp -r "$REPO_PATH/dot-config"     "$INSTALL_PATH/.config"
