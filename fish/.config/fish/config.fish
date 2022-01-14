if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting

switch (uname)
	case Darwin
		fish_add_path /opt/homebrew/bin/
end
