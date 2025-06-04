xrandr --output LVDS-1 --gamma 1.0:1:0.9

export XDG_CURRENT_DESKTOP=i3

cd ~

feh --bg-fill ~/media/images/wall2-rosepine.jpg

# disable mouse accel
xinput set-prop 'SynPS/2 Synaptics TouchPad' 298 0

exec i3
