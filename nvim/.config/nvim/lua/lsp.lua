local lspconfig = require('lspconfig')
local lsp_defaults = lspconfig.util.default_config
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}


lsp_defaults.capabilities = vim.tbl_deep_extend(
  'force',
  lsp_defaults.capabilities,
  require('cmp_nvim_lsp').default_capabilities()
  )

--lspconfig.sumneko_lua.setup({})
lspconfig.tsserver.setup({})
lspconfig.angularls.setup({})
lspconfig.yamlls.setup({})

local keymap = {
  s = {
    name = "LSP",
    h = { "<cmd>lua vim.lsp.buf.hover()<cr>", "Hover" },
    d = { "<cmd>lua vim.lsp.buf.definition()<cr>", "Go to definition" },
    D = { "<cmd>lua vim.lsp.buf.declaration()<cr>", "Go to declaration" },
    i = { "<cmd>lua vim.lsp.buf.implementation()<cr>", "Go to implementation" },
    o = { "<cmd>lua vim.lsp.buf.type_definition()<cr>", "Go to type definition" },
    r = { "<cmd>lua vim.lsp.buf.references()<cr>", "List references" },
    s = { "<cmd>lua vim.lsp.buf.signature_help()<cr>", "Show signature help" },
    n = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
    a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Show code actions" },
    l = { "<cmd>lua vim.diagnostic.open_float()<cr>", "Show diagnostics" },
    ["]"] = { "<cmd>lua vim.diagnostic.goto_next()<cr>", "Go to next diagnostic" },
    ["["] = { "<cmd>lua vim.diagnostic.goto_prev()<cr>", "Go to prev diagnostic" },
  },
}

require("which-key").register(keymap, {
  mode = "n",
  prefix = "<leader>",
  buffer = nil,
  silent = true,
  noremap = true,
  nowait = false,
})

local cmp = require('cmp')
local luasnip = require('luasnip')

local select_opts = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end
    },
    sources = {
      {name = 'path'},
      {name = 'nvim_lsp', keyword_length = 3},
      {name = 'buffer', keyword_length = 3},
      {name = 'luasnip', keyword_length = 2},
    },
    window = {
      documentation = cmp.config.window.bordered()
    },
    formatting = {
      fields = {'menu', 'abbr', 'kind'},
      format = function(entry, item)
        local menu_icon = {
          nvim_lsp = 'λ',
          luasnip = '⋗',
          buffer = 'Ω',
          path = '🖫',
        }
        item.menu = menu_icon[entry.source.name]
        return item
      end,
    },
    mapping = {
      ['<CR>'] = cmp.mapping.confirm({select = false}),
      ['<Up>'] = cmp.mapping.select_prev_item(select_opts),
      ['<Down>'] = cmp.mapping.select_next_item(select_opts),
      ['<C-p>'] = cmp.mapping.select_prev_item(select_opts),
      ['<C-n>'] = cmp.mapping.select_next_item(select_opts),
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<C-d>'] = cmp.mapping(function(fallback)
        if luasnip.jumpable(1) then
          luasnip.jump(1)
        else
          fallback()
        end
      end, {'i', 's'}),
    ['<C-b>'] = cmp.mapping(function(fallback)
      if luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {'i', 's'}),
  ['<Tab>'] = cmp.mapping(function(fallback)
    local col = vim.fn.col('.') - 1

    if cmp.visible() then
      cmp.select_next_item(select_opts)
    elseif col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
      fallback()
    else
      cmp.complete()
    end
  end, {'i', 's'}),
['<S-Tab>'] = cmp.mapping(function(fallback)
  if cmp.visible() then
    cmp.select_prev_item(select_opts)
  else
    fallback()
  end
end, {'i', 's'}),
    }
  })

local sign = function(opts)
  vim.fn.sign_define(opts.name, {
      texthl = opts.name,
      text = opts.text,
      numhl = ''
    })
end

sign({name = 'DiagnosticSignError', text = '✘'})
sign({name = 'DiagnosticSignWarn', text = '▲'})
sign({name = 'DiagnosticSignHint', text = '⚑'})
sign({name = 'DiagnosticSignInfo', text = ''})

vim.diagnostic.config({
    virtual_text = false,
    severity_sort = true,
    float = {
      border = 'rounded',
      source = 'always',
      header = '',
      prefix = '',
    },
  })

