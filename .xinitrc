[[ -f ~/.Xresources ]] && xrdb -merge -I$HOME ~/.Xresources &
~/.fehbg &
urxvtd --quiet --opendisplay --fork &
compton -bCG &
exec xmonad  
