hl.window_rule({
    name      = "btop",
    match     = { class = "btop-persist" },
    workspace = "special:btop",
    float     = true,
    size      = { "monitor_w*0.66", "monitor_h*0.9" },
    center    = true,
})

-- hl.window_rule({
--     name      = "vesktop",
--     match     = { class = "vesktop" },
--     workspace = "special:vesktop",
--     float     = true,
--     size      = { "monitor_w*0.66", "monitor_h*0.9" },
--     center    = true,
-- })
