set fish_greeting
set -x ANROID_HOME $HOME/Android/Sdk

switch (uname)
	case Darwin
		fish_add_path /opt/homebrew/bin/
end
