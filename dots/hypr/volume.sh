MODE=$1
if [[ "$MODE" == "get" ]]; then
    wpctl get-volume @DEFAULT_SINK@ | tail -c +9 | sed -e "s/0\.//" | sed -e "s/1./1/"
fi

if [[ "$MODE" == "getmute" ]]; then
    if [[ $(wpctl get-volume @DEFAULT_SINK@ | tail -c 2) == "]" ]]; then
        echo "muted"  
    else
        echo "unmuted"
    fi
fi

if [[ "$MODE" == "getmicmte" ]]; then
    if [[ $(wpctl get-volume @DEFAULT_SOURCE@ | tail -c 2) == "]" ]]; then
        echo "muted"  
    else
        echo "unmuted"
    fi
fi

if [[ "$MODE" == "notifyget" ]]; then
    notify-send -u low -t 1500 "volume" "currently $(sh $0 get)%"
fi

if [[ "$MODE" == "up" ]]; then
    wpctl set-volume @DEFAULT_SINK@ 5%+
    notify-send -u low -t 1500 "volume" "changed to $(sh $0 get)%"
fi

if [[ "$MODE" == "down" ]]; then
    wpctl set-volume @DEFAULT_SINK@ 5%-
    notify-send -u low -t 1500 "volume" "changed to $(sh $0 get)%"
fi

if [[ "$MODE" == "mute" ]]; then
    wpctl set-mute @DEFAULT_SINK@ toggle
    notify-send -u low -t 1500 "volume" "$(sh $0 getmute)"
fi

if [[ "$MODE" == "micmute" ]]; then
    wpctl set-mute @DEFAULT_SOURCE@ toggle
    notify-send -u low -t 1500 "microphone" "$(sh $0 getmicmute)"
fi
