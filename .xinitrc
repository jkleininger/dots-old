xset +fp /usr/share/fonts/TTF
xset +fp /usr/share/fonts/local

if [ -d /etc/X11/xinit/xinitrc.d ]; then
  for f in /etc/X11/xinit/xinitrc.d/*; do
    [ -x "$f" ] && . "$f"
  done
  unset f
fi

~/scripts/autostart &

exec ~/scripts/rundwm

