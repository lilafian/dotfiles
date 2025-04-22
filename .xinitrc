xrandr --output HDMI-0 --mode 1920x1080 --pos 0x0 --rotate normal --rate 100 --output DP-0 --primary --mode 2560x1080 --pos 1920x0 --rotate normal --rate 200 --output DP-1 --off --output DP-2 --off --output DP-3 --mode 1920x1080 --pos 4480x0 --rotate normal --rate 100 --output DP-4 --off --output DP-5 --off

while true; do
    xsetroot -name "dwm-6.5 | $( date +"%F %T" )"

    sleep 1s
done &

export XDG_CURRENT_DESKTOP=dwm

cd ~

xsetroot -solid '#10090b'

/usr/lib/pam_kwallet_init &

kwalletd6 &

exec dwm
