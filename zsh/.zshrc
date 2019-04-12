# OMZ home directory
export ZSH=/home/joe/.oh-my-zsh

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

# Couple OMZ settings
COMPLETION_WAITING_DOTS="true"
plugins=(git sudo wd tmux)

# Source OMZ file, needs to be *before* other aliases
source $ZSH/oh-my-zsh.sh

# Fixes some undesirable behavior in Termite with OMZ
export LC_CTYPE="en_US.UTF-8"
export ANDROID_HOME="/home/joe/Android/Sdk/"

# User Specified Aliases
alias ekeymap="vim /home/joe/qmk_firmware/keyboards/ergodox_ez/keymaps/josephemorgan91"
alias rename=perl-rename
alias zconfig="vim ~/.zshrc"
alias zsource="source ~/.zshrc"
alias ls="ls --color=auto"
alias la="ls -a --color=auto"
alias ll="ls -la --color=auto"
alias keyswapper="~/Scripts/keyswapper"
alias sheader="~/Scripts/student_header.sh"
alias ctags="ctags -R -f ./.git/tags ."
alias tmux="tmux -u"
alias R="R --quiet"
alias update-grub="sudo zsh ~/Scripts/update-grub"
alias vimconfig="vim ~/.vimrc"

# Setup folder for dev
	alias cconfig="cp ~/Scripts/ycm_c_config ./.ycm_extra_config.py"
	alias gitignore="cp ~/.dotfiles/.gitignore ./.gitignore"
	alias readme="cp ~/.dotfiles/.README_TEMPLATE ./README"
	alias gogit="readme & gitignore & git init"

	set_wallpaper() {
		echo "Setting wallpaper: $PWD/$1\n"
		ln -s -f -v $PWD/$1 /home/joe/.wallpaper.jpg
		ln -s -f -v $PWD/$2 /home/joe/.wallpaper-lh.jpg
		feh --bg-scale $PWD/$2 --bg-scale $PWD/$1
	}

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
