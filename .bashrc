[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

alias ls='ls --color=auto -N -v'
alias sudo="sudo "
alias dotfiles="/usr/bin/git --git-dir=${HOME}/.dotfiles --work-tree=${HOME}"

export HISTSIZE=
export HISTFILESIZE=
export PROMPT_COMMAND="history -a;"
export HISTCONTROL=ignoreboth:erasedups

export PATH=${HOME}/.local/bin:${PATH}

shopt -s histappend

stty stop ''
stty start ''
stty -ixon
stty -ixoff

if [[ -z ${DISPLAY} ]] && [[ $(tty) = /dev/tty1 ]] && [ -x /usr/bin/sway ]; then
  #export GDK_BACKEND=wayland
  #export CLUTTER_BACKEND=wayland
  export QT_QPA_PLATFORM=wayland-egl
  export SDL_VIDEODRIVER=wayland
  export TERMINAL=termite
  export BROWSER=google-chrome-stable
  exec sway
fi
