if [ $# -eq 0 ]; then
  DWMVOL="V:$( amixer -c0 sget Master | awk -vORS=' ' '/Mono:/ {print($4)}' )";
  DWMDATE="$(date +"%a %d %b %R")";
  echo "$DWMVOL $DWMDATE";
else
  echo "< $1 >";
fi
