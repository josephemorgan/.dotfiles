return {
	"mhartington/formatter.nvim",
	lazy = false,
	config = function()
		local augroup = vim.api.nvim_create_augroup
		local autocmd = vim.api.nvim_create_autocmd
		augroup("__formatter__", { clear = true })
		autocmd("BufWritePost", {
			group = "__formatter__",
			command = ":FormatWrite",
		})

		require("formatter").setup({
			logging = true,
			log_level = vim.log.levels.ERROR,
			filetype = {
				lua = {
					require("formatter.filetypes.lua").stylua,
				},
				typescript = {
					require("formatter.filetypes.typescript").prettier,
				},
				c = {
					require("formatter.filetypes.c").clangformat,
				},
				dart = {
					require("formatter.filetypes.dart").dartformat,
				},
				jsonc = {
					require("formatter.filetypes.json").jq,
				},
                python = {
                    require('formatter.filetypes.python').autopep8
                },
				["*"] = {
					require("formatter.filetypes.any").remove_trailing_whitespace,
				},
			},
		})
	end,
}
