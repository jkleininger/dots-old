#!/bin/sh

#ps cax | grep lxpanel > /dev/null
#if [ $? -eq 0 ]; then
#  echo "Looks like we've already done this."
#else
  lxpanel &
  compton &
  /usr/lib/lxpolkit/lxpolkit &
  unclutter -idle 2 &
  pnmixer &
  batti &
  connman-ui-gtk &
  nitrogen --restore &
  kalu &
  xscreensaver -no-splash &
#fi
