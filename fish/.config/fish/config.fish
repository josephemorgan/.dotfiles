set fish_greeting

if test -n "$(tmux has-session -t main)"
	tmux new-session -s main -d
end

switch (uname)
	case Darwin
		fish_add_path /opt/homebrew/bin/
end
