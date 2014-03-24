xset +fp /usr/share/fonts/TTF
xset +fp /usr/share/fonts/artwiz-fonts
xset +fp /usr/share/fonts/local

#exec stumpwm
#exec i3
#exec wmii
#exec awesome -c ~/.config/awesome/rc.lua
#exec spectrwm
# exec openbox-session
#exec blackbox
#exec enlightenment_start
#exec subtle
#exec twm
#

source /etc/x11/xinit/xinitrc.d/30-dbus
eval $(/usr/bin/gnome-keyring-daemon --start --components=gpg,pkcs11,secrets,ssh)
export GNOME_KEYRING_CONTROL GNOME_KEYRING_PID GPG_AGENT_INFO SSH_AUTH_SOCK

