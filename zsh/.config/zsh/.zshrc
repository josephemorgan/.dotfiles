autoload -U compinit; compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' menu select

source "$ZDOTDIR/spaceship-prompt/spaceship.zsh"
SPACESHIP_PROMPT_ORDER=(dir node exec_time line_sep exit_code char)

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

HISTFILE=~/.config/zsh/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

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

autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search # Up
bindkey "${terminfo[kcud1]}" down-line-or-beginning-search # Down


export EDITOR='nvim'

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
if [[ "${HOST}" == "DEVMORGANJ1" ]]; then
	source /home/joe/.dotfiles/zsh/.config/zsh/.zshrc_devmorganj1
fi
