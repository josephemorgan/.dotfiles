function winboot --wraps='sudo systemctl reboot --boot-loader-entry=auto-windows' --description 'alias winboot=sudo systemctl reboot --boot-loader-entry=auto-windows'
  sudo systemctl reboot --boot-loader-entry=auto-windows $argv; 
end
