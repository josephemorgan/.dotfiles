set fish_greeting

switch (uname)
	case Darwin
		fish_add_path /opt/homebrew/bin/
end

zoxide init fish | source

switch (uname)
	case Linux
		. /usr/share/LS_COLORS/dircolors.csh
end
