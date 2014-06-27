xset +fp /usr/share/fonts/TTF
xset +fp /usr/share/fonts/local
xset +fp /usr/share/fonts/misc

source "$HOME/.xprofile"
source /etc/X11/xinit/xinitrc.d/*

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

~/scripts/autostart &
wmname LG3D

export _JAVA_AWT_WM_NONREPARENTING=1

exec ~/scripts/rundwm

