set fish_greeting

switch (uname)
	case Darwin
		fish_add_path /opt/homebrew/bin/
end

zoxide init fish | source

. /usr/share/LS_COLORS/dircolors.csh
