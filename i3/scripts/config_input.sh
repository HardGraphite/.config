#!/usr/bin/sh

xinput set-prop 'Synaptics TM3289-002' 'libinput Tapping Enabled' 1
xinput set-prop 'Synaptics TM3289-002' 'libinput Tapping Drag Enabled' 1
xinput set-prop 'Synaptics TM3289-002' 'libinput Natural Scrolling Enabled' 1
xinput set-prop 'TPPS/2 Elan TrackPoint' 'libinput Accel Speed' 0.96

fcitx &

sleep 1s
cat << EOF | xmodmap -
remove lock = Caps_Lock
remove control = Control_R
keysym Caps_Lock = Control_R
keysym Control_R = Caps_Lock
add lock = Caps_Lock
add control = Control_R
EOF

