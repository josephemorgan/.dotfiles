# OMZ home directory
export ZSH=/home/$USER/.oh-my-zsh

# Set OMZ theme
ZSH_THEME=spaceship
SPACESHIP_CHAR_SUFFIX=' '
SPACESHIP_HOST_SHOW=always
SPACESHIP_USER_SHOW=always
SPACESHIP_PROMPT_ORDER=(
	user          # Username section
	host          # Hostname section
	dir           # Current directory section
	git           # Git section (git_branch + git_status)
	exec_time     # Execution time
	battery       # Battery level and status
	vi_mode       # Vi-mode indicator
	jobs          # Background jobs indicator
	exit_code     # Exit code section
	char          # Prompt character
)

# Install zsh-completions if it isn't installed
if [[ ! -d "$ZSH/custom/plugins/zsh-completions" ]] ; then
	  git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
fi

#Install zsh-syntax-highlighting if it isn't already
if [[ ! -d "$ZSH/custom/plugins/zsh-syntax-highlighting" ]] ; then
	git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi

# Couple OMZ settings
COMPLETION_WAITING_DOTS="true"
plugins=(git sudo wd tmux zsh-completions zsh-syntax-highlighting)
autoload -U compinit && compinit
export KEYTIMEOUT=1

# Source OMZ file, needs to be *before* other aliases
source $ZSH/oh-my-zsh.sh

# Fixes some undesirable behavior in Termite with OMZ
export LC_CTYPE="en_US.UTF-8"
export ANDROID_HOME="/home/$USER/Android/Sdk/"

# User Specified Aliases
alias rename=perl-rename
alias zsource="source $ZDOTDIR/.zshrc"
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -la --color=auto"
alias R="R --quiet"
alias vim="nvim"
alias emacs="emacsclient -c"
alias rmdir="rmdir --ignore-fail-on-non-empty"

# Uses xclip application to pipe output to clipboard.
# Usage - $ cat /path/to/a/file | xclip
# Works on any utility that produces output
alias xclip="xclip -selection c"

export EDITOR='vim'

if [[ -f /usr/bin/i3 ]] ; then
	~/Scripts/make_local_i3_config
fi

export term="/bin/alacritty"
if [[ "$TERM" == "dumb" ]]; then
	unsetopt zle
	unsetopt prompt_cr
	unsetopt prompt_subst
	unfunction precmd
	unfunction preexec
	PS1='$ '
fi

if [[ "${HOST}" == "jupiter" ]]; then
	sh /home/joe/.dotfiles/zsh/.zshrc_jupiter
fi
if [[ "${HOST}" == "Iluvatar" ]]; then
	sh /home/joe/.dotfiles/zsh/.zshrc_illuvitar
fi
if [[ "${HOST}" == "Mithrandir" ]]; then
	sh /home/joe/.dotfiles/zsh/.zshrc_mithrandir
fi

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/joe/.local/bin/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/joe/.local/bin/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/home/joe/.local/bin/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/home/joe/.local/bin/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

