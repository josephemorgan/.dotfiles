return {

	{
		"neovim/nvim-lspconfig",
		lazy = false,
		opts = {
			diagnostics = { virtual_text = { prefix = "icons" } },
			servers = {
				clangd = {
					init_options = {
						compilationDatabasePath = "./",
					},
				},
				pyright = {},
				ts_ls = {},
				lua_ls = {
					on_init = function(client)
						if client.workspace_folders then
							local path = client.workspace_folders[1].name
							if vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc") then
								return
							end
						end

						client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
							runtime = {
								-- Tell the language server which version of Lua you're using
								-- (most likely LuaJIT in the case of Neovim)
								version = "LuaJIT",
							},
							-- Make the server aware of Neovim runtime files
							workspace = {
								checkThirdParty = false,
								-- library = {
								-- 	vim.env.VIMRUNTIME,
								-- 	-- Depending on the usage, you might want to add additional paths here.
								-- 	-- "${3rd}/luv/library"
								-- 	-- "${3rd}/busted/library",
								-- },
								-- or pull in all of 'runtimepath'. NOTE: this is a lot slower and will cause issues when working on your own configuration (see https://github.com/neovim/nvim-lspconfig/issues/3189)
							},
						})
					end,
					settings = {
						Lua = {},
					},
				},
			},
		},
		dependencies = {
			{
				"williamboman/mason.nvim",
				cmd = {
					"Mason",
					"MasonInstall",
					"MasonUninstall",
					"MasonUninstallAll",
					"MasonLog",
				},
				dependencies = {
					"williamboman/mason-lspconfig.nvim",
					config = function() end,
				},
				config = function() end,
			},
		},
		event = "VeryLazy",
		config = function(_, opts)
			-- LSP servers and clients communicate what features they support through "capabilities".
			--  By default, Neovim support a subset of the LSP specification.
			--  With blink.cmp, Neovim has *more* capabilities which are communicated to the LSP servers.
			--  Explanation from TJ: https://youtu.be/m8C0Cq9Uv9o?t=1275
			--
			-- This can vary by config, but in-general for nvim-lspconfig:

			local lspconfig = require("lspconfig")
			require("mason").setup()

			for server, config in pairs(opts.servers or {}) do
				config.capabilities = require("blink.cmp").get_lsp_capabilities(config.capabilities)
				lspconfig[server].setup(config)
			end

			require("mason-lspconfig").setup({
				ensure_installed = {
					"clangd",
				},
			})
		end,
	},
}
