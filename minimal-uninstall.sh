#!/bin/bash

# See :/minimal-install.sh. We only remove the the non Apt
# dependencies here, since the Apt dependencies might be used
# elsewhere.

sudo rm /usr/bin/gnome-session-xmonad
sudo rm /usr/share/gnome-session/sessions/gnome-xmonad.session
sudo rm /usr/share/xsessions/gnome-xmonad.desktop
