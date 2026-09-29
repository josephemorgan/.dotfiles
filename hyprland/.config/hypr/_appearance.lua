hl.config({
    general = {
        gaps_in     = 5,
        gaps_out    = 10,
        layout      = "dwindle",
        border_size = 3,
        col = {
            active_border   = 0xffffffff,
            inactive_border = 0xff444444,
        },
    },

    decoration = {
        rounding = 5,
    },

    misc = {
        disable_hyprland_logo = true,
    },

    xwayland = {
        force_zero_scaling = true,
    },

    cursor = {
        hide_on_key_press = true,
    },
})

-- Cap a lone tiled window at 24:9, but only on monitors wider than that
-- (full 32:9 G9). The option is global, and on a narrower monitor (16:9 PBP
-- half) Hyprland would pad top/bottom instead, so turn it off there.
local SINGLE_WINDOW_RATIO = { 24, 9 }

local function update_single_window_ratio()
    local monitors = hl.get_monitors()
    if #monitors == 0 then
        return
    end

    local target = SINGLE_WINDOW_RATIO[1] / SINGLE_WINDOW_RATIO[2]
    local all_wider = true
    for _, m in ipairs(monitors) do
        if m.width / m.height <= target then
            all_wider = false
            break
        end
    end

    local want = all_wider and SINGLE_WINDOW_RATIO or { 0, 0 }
    local have = hl.get_config("layout.single_window_aspect_ratio")
    if have and have.x == want[1] and have.y == want[2] then
        return
    end

    hl.config({ layout = { single_window_aspect_ratio = want } })
end

update_single_window_ratio()
hl.on("monitor.added", update_single_window_ratio)
hl.on("monitor.layout_changed", update_single_window_ratio)

hl.curve("fancy", { type = "bezier", points = { { 0.83, 0 }, { 0.17, 1 } } })

hl.animation({ leaf = "windows",    enabled = true, speed = 3, bezier = "fancy", style = "popin" })
hl.animation({ leaf = "fade",       enabled = true, speed = 3, bezier = "fancy" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "fancy", style = "slidevert" })
