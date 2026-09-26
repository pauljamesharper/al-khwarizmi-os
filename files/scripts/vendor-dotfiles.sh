#!/usr/bin/env bash

# Vendor a copy of the personal dotfiles repo into the image at build time so
# a fresh install has it with no network access needed. The per-user setup
# (cloning it into $HOME, running aurora/setup.sh) happens at first login --
# see files/system/usr/bin/al-khwarizmi-first-run -- since that's per-$HOME
# state, not something that belongs in the OSTree commit.
set -oue pipefail

DEST=/usr/share/al-khwarizmi-os/dotfiles
DOTFILES_REPO=https://codeberg.org/gluesniffmonkey/dotfiles.git
DOTFILES_BRANCH=mangowm

echo "Vendoring dotfiles ($DOTFILES_REPO, branch $DOTFILES_BRANCH) into $DEST..."
mkdir -p "$(dirname "$DEST")"
git clone --branch "$DOTFILES_BRANCH" "$DOTFILES_REPO" "$DEST"
