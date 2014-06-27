if [ $# -ne 0 ]; then
  echo "< $1 >";
  exit 0;
fi

DWMSSID="$(iwgetid 2> /dev/null | cut -d'"' -f2)"
if [ "$DWMSSID" != "" ]; then
  DWMSSID="S:[$DWMSSID]"
else
  DWMSSID=""
fi

# DWMBAT="B:[$(cat /sys/class/power_supply/BAT0/capacity)%]"
# DWMCHRG="$(cat /sys/class/power_supply/BAT0/subsystem/ADP1/online)"

if [[ $DWMCHRG == *1* ]]; then
  DWMBAT="$DWMBAT!"
fi

# DWMVOL="V:$( amixer -c0 sget Master | awk -vORS=' ' '/Mono:/ {print($4)}' )";

DWMDATE="$(date +"%a %d %b %R")";

echo "$DWMSSID $DWMBAT $DWMVOL $DWMDATE";

