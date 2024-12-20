return {
		"nvim-treesitter/nvim-treesitter",
		dependencies = { "LiadOz/nvim-dap-repl-highlights" },
		build = ":TSUpdate",
		config = function()
			require("nvim-dap-repl-highlights").setup()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {
					"c",
					"lua",
					"vim",
					"vimdoc",
					"query",
					"elixir",
					"heex",
					"javascript",
					"typescript",
					"html",
					"dap_repl",
				},
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end,
}
