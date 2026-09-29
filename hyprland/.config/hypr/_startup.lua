hl.monitor({
    output   = "desc:Samsung Electric Company Odyssey G95NC HNTWB01218",
    mode     = "7680x2160@240",
    position = "auto",
    scale    = 1.25,
})
hl.monitor({ output = "", mode = "preferred", position = "auto", scale = "auto" })

-- Top-level code runs on every config (re)load, like the old `exec =`
hl.exec_cmd("uwsm app -- ~/Scripts/wallpaper_shuff.sh")

hl.on("hyprland.start", function()
    hl.exec_cmd("uwsm app -- ~/Scripts/import_env tmux")
    hl.exec_cmd('uwsm app -- tmux new-session -s "main"')
    hl.exec_cmd("uwsm app -- waybar")
    hl.exec_cmd("uwsm app -- swaync")
    hl.exec_cmd("uwsm app -- /usr/lib/polkit-kde-authentication-agent-1")
    hl.exec_cmd("uwsm app -- kitty --class=btop-persist --hold btop", { workspace = "special:btop silent" })
    -- hl.exec_cmd("uwsm app -- vesktop", { workspace = "special:vesktop silent" })
    hl.exec_cmd("uwsm app -- dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP")
end)
