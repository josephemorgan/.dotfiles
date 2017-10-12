# OMZ home directory
export ZSH=/home/joe/.oh-my-zsh

# Set OMZ theme
ZSH_THEME=robbyrussell

# Couple OMZ settings
COMPLETION_WAITING_DOTS="true"
plugins=(git sudo wd tmux)

# Source OMZ file, needs to be *before* other aliases
source $ZSH/oh-my-zsh.sh

# Fixes some undesirable behavior in Termite with OMZ
export LC_CTYPE="en_US.UTF-8"
export ANDROID_HOME="/home/joe/Android/Sdk/"

# User Specified Aliases
alias zconfig="vim ~/.zshrc"
alias zsource="source ~/.zshrc"
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -la --color=auto"
alias gitignore="cp ~/.dotfiles/.gitignore ./.gitignore"
alias readme="cp ~/.dotfiles/.README_TEMPLATE ./README"
alias gogit="readme & gitignore & git init"
alias keyswapper="~/Scripts/keyswapper"
alias sheader="~/Scripts/student_header.sh"
alias ctags="ctags -R -f ./.git/tags ."
alias tmux="tmux -u"
alias R="R --quiet"

# Uses xclip application to pipe output to clipboard.
# Usage - $ cat /path/to/a/file | xclip
# Works on any utility that produces output
alias xclip="xclip -selection c"

export EDITOR='vim'

export term="xterm-256color"

# if command -v tmux>/dev/null; then
#   [[ ! $TERM =~ screen ]] && [ -z $TMUX ] && exec tmux
# fi

stty -ixon

xset r rate 200 45
