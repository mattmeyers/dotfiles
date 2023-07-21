# Script adapted from this StackExchange comment:
#   https://unix.stackexchange.com/a/492826

date_formatted=$(date "+%F %H:%M")

battery_info=$(upower --show-info $(upower --enumerate |\
grep 'BAT') |\
egrep "percentage" |\
awk '{print $2}')

audio_volume=$(amixer -M get Master |\
awk '/Mono.+/ {print $6=="[off]" ?\
$4" M": \
$4}' |\
tr -d [])

wifi_network=$(iwgetid wlp2s0 -r)

echo "P:"$battery_info" / V:"$audio_volume" / "$wifi_network" / "$date_formatted" "

