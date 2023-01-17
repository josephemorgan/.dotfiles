local M = {}

local function configure()
end

local function configure_exts()
  require("nvim-dap-virtual-text").setup {
    commented = true,
  }

  local dap, dapui = require "dap", require "dapui"
  dapui.setup {} -- use default
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end
  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end
  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

local function configure_debuggers()
  local mason_path = vim.fn.glob(vim.fn.stdpath "data" .. "/mason/")

  local dap = require('dap')
  dap.adapters.node2 = {
    type = "executable",
    command = "node",
    args = { mason_path .. "packages/node-debug2-adapter/out/src/nodeDebug.js" }
  }

  dap.adapters.chrome = {
    type = "executable",
    command = "node",
    args = { mason_path .. "packages/chrome-debug-adapter/out/src/chromeDebug.js" }
  }

  dap.adapters.firefox = {
    type = "executable",
    command = "node",
    args = { mason_path .. "packages/firefox-debug-adapter/dist/adapter.bundle.js" }
  }

  dap.configurations.typescript = {
    {
      name = 'Launch',
      type = 'node2',
      request = 'launch',
      program = '${file}',
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = 'inspector',
      console = 'integratedTerminal',
    },
    {
      -- For this to work you need to make sure the node process is started with the `--inspect` flag.
      name = 'Attach to process',
      type = 'node2',
      request = 'attach',
      processId = require'dap.utils'.pick_process,
    },
    {
      name = 'Debug with Chrome',
      type = "chrome",
      request = "attach",
      -- program = "${file}",
      cwd = vim.fn.getcwd(),
      sourceMaps = true,
      protocol = "inspector",
      port = 9222,
      webRoot = "${workspaceFolder}"
    },
    {
      name = 'Debug with Firefox',
      type = 'firefox',
      request = 'launch',
      reAttach = true,
      url = 'http://localhost:3000',
      webRoot = '${workspaceFolder}',
      firefoxExecutable = "/opt/homebrew/Caskroom/firefox-developer-edition/latest/Firefox Developer Edition.app/"
    }
  }

end

function M.setup()
  configure()
  configure_exts()
  configure_debuggers()
  require('config.dap.keymaps').setup()
end

configure_debuggers()


return M
