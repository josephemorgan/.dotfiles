local terminal    = "uwsm app -- kitty"
local fileManager = "uwsm app -- dolphin"
local menu        = 'uwsm app -- fuzzel --launch-prefix "uwsm app --"'

local mod = "SUPER"

-- Launchers
hl.bind(mod .. " + grave",  hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + SPACE",  hl.dsp.exec_cmd(menu))

hl.bind(mod .. " + p", hl.dsp.window.pseudo())

-- Float and size to 60% x 90% of the monitor. resize() only takes absolute
-- numbers, so the old `exact 60% 90%` is computed from the monitor's logical size.
hl.bind(mod .. " + f", function()
    hl.dispatch(hl.dsp.window.float({ action = "enable" }))
    local m = hl.get_active_monitor()
    if m then
        hl.dispatch(hl.dsp.window.resize({ x = m.width / m.scale * 0.6, y = m.height / m.scale * 0.9 }))
    end
end)
hl.bind(mod .. " + SHIFT + f", hl.dsp.window.fullscreen())
hl.bind(mod .. " + c",         hl.dsp.window.center())

hl.bind(mod .. " + d", hl.dsp.window.float({ action = "disable" }))

hl.bind(mod .. " + q", hl.dsp.window.close())

-- Shortcuts
hl.bind(mod .. " + s", hl.dsp.submap("screenshot"))
hl.define_submap("screenshot", function()
    hl.bind("w",         hl.dsp.exec_cmd("uwsm app -- hyprshot -m window --clipboard-only"), { repeating = true })
    hl.bind("SHIFT + w", hl.dsp.exec_cmd("uwsm app -- hyprshot -m window"),                  { repeating = true })
    hl.bind("r",         hl.dsp.exec_cmd("uwsm app -- hyprshot -m region --clipboard-only"), { repeating = true })
    hl.bind("SHIFT + r", hl.dsp.exec_cmd("uwsm app -- hyprshot -m region --clipboard-only"), { repeating = true })
    hl.bind("o",         hl.dsp.exec_cmd("uwsm app -- hyprshot -m output --clipboard-only"), { repeating = true })
    hl.bind("SHIFT + o", hl.dsp.exec_cmd("uwsm app -- hyprshot -m output --clipboard-only"), { repeating = true })

    hl.bind("escape", hl.dsp.submap("reset"))
end)

-- Window Control
local directions = { l = "right", h = "left", k = "up", j = "down" }

for key, dir in pairs(directions) do
    -- Switching Focus
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ direction = dir }))

    -- Preselect Split
    hl.bind(mod .. " + ALT + " .. key, hl.dsp.layout("preselect " .. dir:sub(1, 1)))

    -- Moving Windows
    hl.bind(mod .. " + SHIFT + " .. key,       hl.dsp.window.swap({ direction = dir }), { repeating = true })
    hl.bind(mod .. " + SHIFT + ALT + " .. key, hl.dsp.window.move({ direction = dir }), { repeating = true })
end

-- Resizing Windows
local resize_steps = { l = { 1, 0 }, h = { -1, 0 }, k = { 0, -1 }, j = { 0, 1 } }

hl.bind(mod .. " + r", hl.dsp.submap("resize"), { repeating = true })
hl.define_submap("resize", function()
    for key, v in pairs(resize_steps) do
        -- Small Increments
        hl.bind("SHIFT + " .. key, hl.dsp.window.resize({ x = v[1] * 20,  y = v[2] * 20,  relative = true }), { repeating = true })
        -- Larger Increments
        hl.bind(key,               hl.dsp.window.resize({ x = v[1] * 100, y = v[2] * 100, relative = true }), { repeating = true })
    end

    hl.bind("escape", hl.dsp.submap("reset"), { repeating = true })
end)

-- Grouping Windows (stacks)
hl.bind(mod .. " + t",   hl.dsp.group.toggle())
hl.bind(mod .. " + tab", hl.dsp.group.next())

for i = 1, 5 do
    -- Switch to Workspace
    hl.bind(mod .. " + " .. i,         hl.dsp.focus({ workspace = i }))
    -- Move window to workspace
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, follow = false }))
end

hl.bind(mod .. " + SHIFT + i", hl.dsp.window.move({ workspace = "special", follow = false }))
hl.bind(mod .. " + i",         hl.dsp.workspace.toggle_special())

-- Special Workspaces
hl.bind(mod .. " + v", hl.dsp.workspace.toggle_special("vesktop"))
hl.bind(mod .. " + b", hl.dsp.workspace.toggle_special("btop"))

-- Mouse Movement
hl.bind(mod .. " + mouse:272",  hl.dsp.window.drag(),   { mouse = true })
hl.bind(mod .. " + mouse:273",  hl.dsp.window.resize(), { mouse = true })
hl.bind(mod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))
