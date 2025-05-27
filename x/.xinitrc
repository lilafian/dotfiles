export XDG_CURRENT_DESKTOP=i3

cd ~

# disable mouse accel
xinput set-prop 'SynPS/2 Synaptics TouchPad' 298 0

feh --bg-scale ~/media/images/wall2-rosepine.jpg

exec i3
