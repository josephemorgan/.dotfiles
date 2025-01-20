return {
	"nvim-neorg/neorg",
	dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
	lazy = false, -- Disable lazy loading as some `lazy.nvim` distributions set `lazy = true` by default
	version = "*", -- Pin Neorg to the latest stable release
	config = function()
		require("neorg").setup({
			load = {
				["core.defaults"] = {}, -- Load all the default modules
				["core.concealer"] = {}, -- Allows for use of icons
				["core.dirman"] = { -- Manage your directories with Neorg
					config = {
						workspaces = {
							neorg = "~/neorg",
						},
						default_workspace = "neorg",
					},
				},
				["core.integrations.telescope"] = {}, -- Enable the telescope module
			},
		})

		vim.wo.foldlevel = 99
		vim.wo.conceallevel = 2
	end,
}
