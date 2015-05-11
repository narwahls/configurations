# Copyright Fabian Grunau
# Startup File with defult Settings

# Default Applications
export TERMINAL=urxvt
export BROWSER=firefox
export EDITOR=vim

# Default .Xdefaults Design
 # soll = Solarized Light
 # sold = Solarized Dark
 # Design defined in .Xdefaults file
alias 'sold=xrdb -DSOLARIZED_DARK -merge $HOME/.Xdefaults'
alias 'soll=xrdb -DSOLARIZED_LIGHT -merge $HOME/.Xdefaults'
soll

