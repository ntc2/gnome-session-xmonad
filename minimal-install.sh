#!/bin/bash

# Change to dir containing this script.
HERE="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
cd "$HERE"

# Install Apt dependency packages from Ubuntu and Gnome/GDM session
# files from this repo needed to build a custom ~/.xmonad/xmonad.hs
# and run it in Gnome/GDM. In particular, we avoid installing an
# Ubuntu GHC distribution, since we get that from Stack (not part of
# this script).

# Some Apt deps based on :/debian/control, with
# libghc-xmonad-contrib-dev not included to avoid bringing in an
# entire Ubuntu GHC distribution.
#
# The xmonad package recommends but does not depend on the Ubuntu GHC
# distribution, and we don't want to install it.
sudo apt-get install --no-install-recommends xmonad
# The gnome-session-flashback has useful recommends, including
# gnome-panel and (transitively) gnome-indicator-applet-complete.
sudo apt-get install gnome-session-flashback

# More Apt deps, from
# https://github.com/xmonad/xmonad/blob/master/README.md. These are
# similar to the non-GHC Apt deps of libghc-xmonad-contrib-dev.
sudo apt-get install libx11-dev libxinerama-dev libxext-dev \
     libxft-dev libxinerama-dev libxrandr-dev libxss-dev

# Gnome/GDM files. The destinations are based on :/debian/install.
#
# The gnome-session-xmonad script is not used by the
# gnome-xmonad.session on Ubuntu 18.04
#
#sudo install gnome-session-xmonad /usr/bin
sudo install --mode=0644 gnome-xmonad.session /usr/share/gnome-session/sessions
sudo install --mode=0644 gnome-xmonad.desktop /usr/share/xsessions
