require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'nvim-lualine/lualine.nvim'
  use 'kyazdani42/nvim-web-devicons'

  use 'nvim-tree/nvim-tree.lua'
  use 'terrortylor/nvim-comment'

  -- Fuzzy file opener
  use 'ctrlpvim/ctrlp.vim'

  -- Opens window to show tags in a file
  use 'majutsushi/tagbar'

  -- Intuitive navigation, alternative to hjkl keys
  use 'easymotion/vim-easymotion'

  -- Vim/tmux integration- Use hjkl to switch panes
  use 'christoomey/vim-tmux-navigator'

  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'saadparwaiz1/cmp_luasnip'
  use 'hrsh7th/nvim-cmp'
  use({"L3MON4D3/LuaSnip", tag = "v<CurrentMajor>.*"})


  -- IDE-like debugging
  -- use 'puremourning/vimspector'

  -- Advaned syntax highlighting
  use 'octol/vim-cpp-enhanced-highlight'

  -- Smooth Scrolling
  use 'terryma/vim-smooth-scroll'

  -- Easy moving of highlighted blocks
  use 'matze/vim-move'

  -- Vim with Latex
  use 'lervag/vimtex'

  -- Abbreviation Expander
  use 'mattn/emmet-vim'

  -- Vim Snippets
  use 'rafamadriz/friendly-snippets'

  -- Improved Javascript syntax highlighting and indentation
  use 'pangloss/vim-javascript'
  use 'briancollins/vim-jst'

  -- Some colorschemes - ymmv
  use 'nanotech/jellybeans.vim'
  use 'dracula/vim'
  use 'altercation/vim-colors-solarized'

  -- Language Pack
  use 'sheerun/vim-polyglot'

  -- Git intigration
  use 'tpope/vim-fugitive'

  -- Git package manager for LSP services and DAPs
  use 'williamboman/mason.nvim'
  use {
    'folke/which-key.nvim',
    config = function()
      require("which-key").setup({})
    end
  }

  use {
    "mfussenegger/nvim-dap",
    wants = { "nvim-dap-virtual-text", "DAPInstall.nvim", "nvim-dap-ui", "nvim-dap-python", "which-key.nvim" },
    requires = {
      "Pocco81/DAPInstall.nvim",
      "theHamsta/nvim-dap-virtual-text",
      "rcarriga/nvim-dap-ui",
      "mfussenegger/nvim-dap-python",
      "nvim-telescope/telescope-dap.nvim",
      { "leoluz/nvim-dap-go", module = "dap-go" },
      { "jbyuki/one-small-step-for-vimkind", module = "osv" },
    }
  }

  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
end)

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'iceberg_dark',
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {
    lualine_a = {'buffers'},
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {'tabs'}
  },
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

require("nvim-tree").setup({
    sort_by = "case_sensitive",
    view = {
      adaptive_size = true,
      mappings = {
        list = {
          { key = "u", action = "dir_up" },
        },
      },
    },
    renderer = {
      group_empty = true,
    },
    filters = {
      dotfiles = true,
    },
  })

require('nvim_comment').setup()

require('luasnip.loaders.from_vscode').lazy_load()

require('mason').setup()
