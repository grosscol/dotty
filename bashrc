################################
# My customizations start here #
################################

##################
## PATH UPDATES ##
##################

export PATH="$PATH":"/opt/stardog-5.0.2/bin"
export PATH=$PATH:/opt/gradle/gradle-3.5/bin
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:/home/grosscol/go/bin
export PATH=~/.local/bin:$PATH
# Add rbenv to path and init
export PATH="$PATH":"$HOME/.rbenv/bin"
eval "$(rbenv init -)"

##############
## ENV VARS ##
##############

export NVM_DIR="$HOME/.nvm"
export GIT_EDITOR=vim
export STARDOG_HOME="/var/local/stardog"
export GPG_TTY=$(tty)
export R_LIBS_USER=~/R/x86_64-pc-linux-gnu-library/dev/
export AWS_DEFAULT_KEY_NAME=fill-in-aws-keyname

####################
## SSH IDENTITIES ##
####################

if [[ `ssh-add -l` == *"fill-in-github-keyname"* ]]; then 
echo 'github identity aldready added.'
else
  ssh-add -t 8h ~/.ssh/fill-in-github-keyname
fi

if [[ `ssh-add -l` == *"fill-in-aws-keyname.pem"* ]]; then 
echo 'useast identity aldready added.'
else
  ssh-add -t 8h ~/.ssh/fill-in-aws-keyname.pem
fi

###############
## FUNCTIONS ##
###############

git_mod_files_list(){
  git diff --name-only | awk 'BEGIN {ORS=" "}; {print $1}'
}

vimsplat(){
  xargs bash -c '</dev/tty vim -p "$@"'
}

# Function to set the title of the window
function retitle(){
  echo -ne "\033]2;$1\007"
}

# Prepend timestamp to file name
function stampit () { 
  local DNAME=$(dirname "$1")
  local BNAME=$(basename "$1")
  local NNAME="$(date '+%Y%m%d-%H%M%S')"_"${BNAME}"
  mv "$1" "${DNAME}"/"${NNAME}"
}

parse_pwd(){
  pwd | awk 'BEGIN {FS="/";OFS=""}; {print $(NF-1),"/",$NF}'
}

parse_git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# Arguments:
#  1. What to search for
#  2. Which gem names to search (defaults to all gems)
function bgrep {
  #ag "$@" $(bundle show --paths) .
  pattern="$1"; shift
  ag "$pattern" $(bundle show --paths "$@")
}

#############
## ALIASES ##
#############

alias bunx='bundle exec'
alias vimmodified='vim -p `git_mod_files_list`'
alias bat='upower -i /org/freedesktop/UPower/devices/battery_BAT0| grep -E "state|to\ full|percentage"'
# Add alias to purge branches that have been merged
alias gbpurge='git branch --merged | grep -Ev "(\*|master|develop|staging)" | xargs -n 1 git branch -d'

# Rapid directory ascension
alias ..2="cd ../.."
alias ..3="cd ../../.."
alias ..4="cd ../../../.."
alias ..5="cd ../../../../.."

##########
# PROMPT #
##########

# PS1 terminated by a neat unicode char ⇶ ⥈ ⮞ ∫
PS1='∫ $(parse_pwd) $(parse_git_branch)⮞ '

##############
# COMPLETERS #
##############

# Excercism code completion
if [ -f ~/.config/exercism/exercism_completion.bash ]; then
    . ~/.config/exercism/exercism_completion.bash
fi

# AWS completer
complete -C '/home/grosscol/miniconda3/bin/aws_completer' aws

#################
# Key Remapping #
#################

# Remap Caps Lock to Esc
xmodmap ~/.caps_to_esc

###############
# SYSTEM BELL #
###############

# Change pulse audio bell intercept to something less annoying.
MUTED_LOADED=$(pactl list short modules | grep -c mutedbell)
if [[ ${SOOTHING_LOADED} -eq 0 ]]; then
  pactl upload-sample /usr/share/cinnamon/sounds/togglekeys-sound-off.ogg mutedbell 
  pactl unload-module module-x11-bell
  pactl load-module module-x11-bell sample=mutedbell 1> /dev/null
else
  echo "muted bell already loaded."
fi

################
# PYTHON SETUP #
################

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/grosscol/miniconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/grosscol/miniconda3/etc/profile.d/conda.sh" ]; then
        . "/home/grosscol/miniconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/grosscol/miniconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

##############
# NODE SETUP #
##############
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
