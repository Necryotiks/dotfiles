[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &
~/.fehbg &
urxvtd --quiet --opendisplay --fork &
compton -bCG &
setxkbmap dvorak &
pulseaudio -D &
xset s off -dpms &
exec xmonad  
