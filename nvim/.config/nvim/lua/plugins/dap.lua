return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/cmp-dap",
		"mxsdev/nvim-dap-vscode-js",
		{
			"microsoft/vscode-js-debug",
			build = "npm ci --loglevel=error && npx gulp vsDebugServerBundle && mv dist out",
		},
		{
			"Joakker/lua-json5",
			build = "./install.sh",
		},
		{
			"rcarriga/nvim-dap-ui",
			dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
			opts = {
				controls = {
					element = "repl",
					enabled = true,
					icons = {
						disconnect = "",
						pause = "",
						play = "",
						run_last = "",
						step_back = "",
						step_into = "",
						step_out = "",
						step_over = "",
						terminate = "",
					},
				},
				element_mappings = {},
				expand_lines = true,
				floating = {
					border = "single",
					mappings = {
						close = { "q", "<Esc>" },
					},
				},
				force_buffers = true,
				icons = {
					collapsed = "",
					current_frame = "",
					expanded = "",
				},
				layouts = {
					{
						elements = {
							{
								id = "scopes",
								size = 0.25,
							},
							{
								id = "breakpoints",
								size = 0.25,
							},
							{
								id = "stacks",
								size = 0.25,
							},
						},
						position = "left",
						size = 40,
					},
					{
						elements = {
							{
								id = "repl",
								size = 0.5,
							},
							{
								id = "console",
								size = 0.5,
							},
						},
						position = "bottom",
						size = 10,
					},
				},
				mappings = {
					edit = "e",
					expand = { "<CR>", "<2-LeftMouse>" },
					open = "o",
					remove = "d",
					repl = "r",
					toggle = "t",
				},
				render = {
					indent = 1,
					max_value_lines = 100,
				},
			},
		},
	},
	lazy = false,
	config = function()
		local dap = require("dap")

		dap.adapters.dart = {
			type = "executable",
			command = "flutter",
			args = { "debug_adapter" },
		}

		dap.configurations.dart = {
			{
				type = "dart",
				request = "launch",
				name = "Launch Flutter",
				-- The nvim-dap plugin populates this variable with the filename of the current buffer
				program = "${workspaceFolder}/lib/main.dart",
				-- The nvim-dap plugin populates this variable with the editor's current working directory
				cwd = "${workspaceFolder}",
				-- This gets forwarded to the Flutter CLI tool, substitute `linux` for whatever device you wish to launch
				toolArgs = { "-d", "emulator-5554" },
			},
		}

		require("dap").adapters["pwa-node"] = {
			type = "server",
			host = "localhost",
			port = "${port}",
			executable = {
				command = "node",
				args = {
					vim.call("stdpath", "data") .. "/lazy/vscode-js-debug/out/src/vsDebugServer.js",
					"${port}",
				},
			},
		}

		for _, language in ipairs({ "typescript", "javascript" }) do
			require("dap").configurations[language] = {
				{
					type = "pwa-node",
					name = "Node",
					request = "launch",
					program = "${file}",
					cwd = "${workspaceFolder}",
					console = "integratedTerminal",
					skipFiles = {
						"<node_internals>/",
						"${workspaceFolder}/node_modules/",
					},
				},
				{
					type = "pwa-node",
					request = "attach",
					name = "Auto Attach",
					cwd = vim.fn.getcwd(),
					protocol = "inspector",
				},
			}
		end

		local dapui = require("dapui")

		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end

		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end

		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
