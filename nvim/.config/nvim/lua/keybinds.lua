return {
	setup = function()
		local wk = require("which-key")
		local telescope = require("telescope.builtin")

		wk.add({
			-- Misc
			{ "K", vim.lsp.buf.hover, desc = "Show [K]ind" },
			{ "<leader>/", ":noh<CR>", desc = "Clear [s]earch" },

			-- Copilot
			{
				"<leader><S-c>",
				group = "[C]opilot",
				{
					"<S-Tab>",
					mode = { "i" },
					function()
						if require("copilot.suggestion").is_visible() then
							require("copilot.suggestion").accept()
						end
					end,
					desc = "Accept Copilot Suggestion",
				},
				{
					"<leader><S-c>c",
					function()
						require("CopilotChat").toggle({ window = { layout = "float" } })
					end,
					desc = "Copilot",
				},
			},
			-- File Navigation
			{
				"<leader>p",
				group = "File [n]avigation",
				{ "<c-p>", telescope.find_files, desc = "Find files" },
				{ "<leader>pb", telescope.buffers, desc = "List [b]uffers" },
				-- { "<leader>pt", require("nvim-tree.api").tree.open, desc = "Toggle [t]ree" },
				{ "<leader>pt", require("telescope.builtin").builtin, desc = "[t]elescope" },
				{ "<leader>pp", require("telescope").extensions.projects.projects, desc = "[p]rojects" },
				{ "<leader>pr", require("telescope").extensions.file_browser.file_browser, desc = "b[r]owse files" },
				{ "<leader>pf", require("telescope").extensions.flutter.commands, desc = "[f]lutter commands" },
			},

			-- File Editing
			{
				"<leader>e",
				group = "[e]dit",
				{ "<leader>ef", ":Format<cr>", desc = "Format [f]ile" },
			},

			-- Search
			{ "<leader>s", group = "[s]earch" },
			{ "<leader>ss", require("telescope.builtin").current_buffer_fuzzy_find, desc = "[s]earch buffer" },
			{ "<leader>sf", require("telescope.builtin").live_grep, desc = "search [f]iles" },

			-- Jump Navigation
			{ "<leader>j", group = "[j]ump" },
			{
				"<leader>jj",
				mode = { "n", "x", "o" },
				function()
					require("flash").jump()
				end,
				desc = "[j]ump",
			},
			{ "<leader>jd", vim.lsp.buf.declaration, desc = "[d]eclaration" },
			{ "<leader>jD", require("telescope.builtin").lsp_definitions, desc = "[D]efinitions" },
			{ "<leader>jI", require("telescope.builtin").lsp_implementations, desc = "[i]mplementations" },
			{ "<leader>jt", require("flash").treesitter, desc = "Treesitter Jump" },

			-- Help
			{ "<leader>h", group = "[H]elp" },
			{ "<leader>hh", require("telescope.builtin").help_tags, desc = "Search [h]elp" },
			{ "<leader>hm", require("telescope.builtin").man_pages, desc = "Search [m]anpages" },

			-- LSP
			{ "<leader>l", group = "[L]anguage Server" },
			{ "<leader>ld", vim.diagnostic.open_float, desc = "Open [d]iagnostics" },
			{ "<leader>ls", require("telescope.builtin").lsp_document_symbols, desc = "Document [s]ymbols" },
			{ "<leader>ll", require("telescope.builtin").diagnostics, desc = "[l]ist Diagnostics" },
			{ "<leader>lh", vim.lsp.buf.signature_help, desc = "Signature [h]elp" },
			{ "<leader>lr", vim.lsp.buf.rename, desc = "[r]ename" },
			{ "<leader>la", vim.lsp.buf.code_action, desc = "Code [a]ction" },
			{ "<leader>lR", require("telescope.builtin").lsp_references, desc = "Show [R]eferences" },
			{ "<leader>lp", vim.diagnostic.goto_previous, desc = "[p]revious Diagnostic" },
			{ "<leader>ln", vim.diagnostic.goto_next, desc = "[n]ext Diagnostic" },
			{
				{ "<leader>g", group = "[g]o to" },
				{ "<leader>gp", vim.diagnostic.goto_previous, desc = "[p]revious Diagnostic" },
				{ "<leader>gn", vim.diagnostic.goto_next, desc = "[n]ext Diagnostic" },
				{ "<leader>gd", vim.lsp.buf.declaration, desc = "[d]eclaration" },
				{ "<leader>gD", require("telescope.builtin").lsp_definitions, desc = "[D]efinitions" },
				{ "<leader>gi", require("telescope.builtin").lsp_implementations, desc = "[i]mplementations" },
			},

			-- DAP
			{
				{ "<leader>d", group = "[d]ebug" },

				{
					"<leader>dc",
					function()
						require("dap").continue()
					end,
					desc = "[c]ontinue (or start)",
				},
				{
					"<leader>dl",
					function()
						require("dap.ext.vscode").load_launchjs(nil, {
							["node"] = { "javascript", "typescript" },
							["pwa-node"] = { "javascript", "typescript" },
							["pwa-chrome"] = { "javascript", "typescript" },
							["pwa-msedge"] = { "javascript", "typescript" },
							["node-terminal"] = { "javascript", "typescript" },
							["pwa-extensionHost"] = { "javascript", "typescript" },
						})
						require("dap").continue()
					end,
					desc = "[l]oad launch.js",
				},
				{ "<leader>do", require("dap").step_over, desc = "Step [o]ver" },
				{ "<leader>di", require("dap").step_into, desc = "Step [i]nto" },
				{ "<leader>dO", require("dap").step_out, desc = "Step [O]ut" },
				{ "<leader>db", require("dap").toggle_breakpoint, desc = "Toggle [b]reakpoint" },
				{ "<leader>dB", require("dap").set_breakpoint, desc = "Set [B]reakpoint" },
				{ "<leader>dr", require("dap").repl.open, desc = "Open [r]EPL" },
				{ "<leader>dR", require("dap").restart, desc = "[R]estart" },
				{ "<leader>dh", require("dap.ui.widgets").hover, desc = "[h]over" },
				{ "<leader>dp", require("dap.ui.widgets").preview, desc = "[p]review" },
				{
					"<leader>df",
					function()
						local widgets = require("dap.ui.widgets")
						widgets.centered_float(widgets.frames)
					end,
					desc = "[f]rames",
				},
				{
					"<leader>ds",
					function()
						local widgets = require("dap.ui.widgets")
						widgets.centered_float(widgets.scopes)
					end,
					desc = "[s]copes",
				},
			},
		})
	end,
}
