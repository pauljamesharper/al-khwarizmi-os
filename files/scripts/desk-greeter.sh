#!/usr/bin/env bash

# Install the "desk" SDDM theme from the vendored dotfiles (aurora/sddm/desk),
# with the Giants "Turing - von Neumann" picture as its background, and make
# it SDDM's theme. Runs after vendor-dotfiles.sh. In the image it can live in
# /usr/share; dotfiles' setup.sh puts it in /usr/local on a stock Aurora.
set -oue pipefail

SRC=/usr/share/al-khwarizmi-os/dotfiles
THEME=/usr/share/sddm/themes/desk

install -d "$THEME" /usr/lib/sddm/sddm.conf.d
install -m 0644 "$SRC"/aurora/sddm/desk/{Main.qml,metadata.desktop,theme.conf} "$THEME"/
install -m 0644 "$SRC"/desk/.local/share/wallpapers/Giants/1-turing-von-neumann.jpg "$THEME"/background.jpg
cat > /usr/lib/sddm/sddm.conf.d/10-desk.conf <<'CONF'
# al-khwarizmi-os: the desk greeter (theme from the dotfiles' aurora/sddm/).
[Theme]
Current=desk
CursorTheme=breeze_cursors
CONF
echo "Installed SDDM theme $THEME"
