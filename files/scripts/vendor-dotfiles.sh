#!/usr/bin/env bash

# Vendor a copy of the personal dotfiles repo into the image at build time so
# a fresh install has it available with no network access needed. The actual
# per-user setup (cloning it into $HOME, running install.sh) happens at first
# login instead -- see files/system/usr/bin/al-khwarizmi-first-run -- since
# that's fundamentally a per-user, post-boot job, not something that belongs
# baked into the OSTree commit itself.
set -oue pipefail

DEST=/usr/share/al-khwarizmi-os/dotfiles
DOTFILES_REPO=https://codeberg.org/gluesniffmonkey/dotfiles.git
DOTFILES_BRANCH=Fedora-Atomic

echo "Vendoring dotfiles ($DOTFILES_REPO, branch $DOTFILES_BRANCH) into $DEST..."
mkdir -p "$(dirname "$DEST")"
git clone --branch "$DOTFILES_BRANCH" "$DOTFILES_REPO" "$DEST"
