let g:python3_host_prog = "/opt/homebrew/bin/python3.9"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Joseph Edward Morgan
""" .vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" vim-plug
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

call plug#begin()
" Shows useful information via bars above and below buffer
Plug 'vim-airline/vim-airline'
Plug 'powerline/fonts'
Plug 'vim-airline/vim-airline-themes'

" File Manager within vim
Plug 'scrooloose/nerdtree'
Plug 'PhilRunninger/nerdtree-visual-selection'

" Fuzzy file opener
Plug 'ctrlpvim/ctrlp.vim'

" Opens window to show tags in a file
Plug 'majutsushi/tagbar'

" Intuitive navigation, alternative to hjkl keys
Plug 'easymotion/vim-easymotion'

" Vim/tmux integration- Use hjkl to switch panes
Plug 'christoomey/vim-tmux-navigator'

" Insanely good tab code completion
" Plug 'ycm-core/YouCompleteMe'
" Plug 'rdnetto/YCM-Generator'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

" IDE-like debugging
" Plug 'puremourning/vimspector'

" Advaned syntax highlighting
Plug 'octol/vim-cpp-enhanced-highlight'

" Smart commenting
Plug 'scrooloose/nerdcommenter'

" Smooth Scrolling
Plug 'terryma/vim-smooth-scroll'

" Easy moving of highlighted blocks
Plug 'matze/vim-move'

" Automatically close brackets
" Plug 'jiangmiao/auto-pairs'

" Vim with Latex
Plug 'lervag/vimtex'

" Abbreviation Expander
Plug 'mattn/emmet-vim'

" Vim Snippets
" Plug 'SirVer/ultisnips'
" Plug 'honza/vim-snippets'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'
Plug 'rafamadriz/friendly-snippets'

" Bootstrap Snippets
" Plug 'jvanja/vim-bootstrap4-snippets'

" Improved Javascript syntax highlighting and indentation
Plug 'pangloss/vim-javascript'
Plug 'briancollins/vim-jst'

" Some colorschemes - ymmv
Plug 'nanotech/jellybeans.vim'
Plug 'dracula/vim'
Plug 'altercation/vim-colors-solarized'

" GLSL Syntax Support
Plug 'tikhomirov/vim-glsl'

" Language Pack
Plug 'sheerun/vim-polyglot'

" Git intigration
Plug 'tpope/vim-fugitive'

call plug#end()


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General .vimrc config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"

set termguicolors
set incsearch
set hlsearch
set relativenumber
set comments=sl:/*,mb:\ *,elx:\ */
au FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set backspace=2
syntax on
set background=dark
colorscheme jellybeans
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set encoding=utf8
set ruler
set autoindent
set cinoptions=g0:0
set tabstop=2        " tab width is 2 spaces
set softtabstop=2
set shiftwidth=2     " indent also with 2 spaces
set textwidth=0
set t_Co=256
set number
set showmatch
set nospell
set expandtab

nnoremap <c-<Left>> <c-w>h
nnoremap <c-<Right>> <c-w>l

nmap <leader>w :wa<CR>
nmap <leader>Q :wqa<CR>
nmap <leader>Q :wqa<CR>
nmap <leader>/ :noh<CR>

nnoremap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarTogglePause<CR>
set foldmethod=syntax
set foldnestmax=1
set foldlevel=1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" FileType Specific Settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd Filetype cs setlocal expandtab tabstop=4 shiftwidth=4 softtabstop=4


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" NERDTree config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NERDTree shows hidden files by default

let NERDTreeShowHidden=1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" vim-airline config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Uses vim-airline to emulate actual tab functionality (vs the misleading tabs included in vim)
" Enable to list of buffers
let g:airline#extensions#tabline#enabled = 1

" Show buffer number in bufferline
let g:airline#extensions#tabline#buffer_idx_mode = 1

"" Some vim-airline hotkeys to emulate tab functionality
set hidden

" New tab
nmap <leader>T :enew<CR>

" Next buffer
nmap <leader>l :bnext<CR>

" Prev buffer
nmap <leader>h :bprev<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

let g:airline_powerline_fonts = 1

set laststatus=2



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" NERDCommenter config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" vim-smooth-scroll config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 8, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 8, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 8, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 8, 4)<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" vimtex config 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimtex_view_general_viewer = '/usr/bin/zathura'
let g:tex_flavor = 'lualatex'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" snippets config 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" NOTE: You can use other key to expand snippet.

" Expand
imap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'
smap <expr> <C-j>   vsnip#expandable()  ? '<Plug>(vsnip-expand)'         : '<C-j>'

" Expand or jump
imap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'
smap <expr> <C-l>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'

" Jump forward or backward
imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'

" Select or cut text to use as $TM_SELECTED_TEXT in the next snippet.
" See https://github.com/hrsh7th/vim-vsnip/pull/50
nmap        s   <Plug>(vsnip-select-text)
xmap        s   <Plug>(vsnip-select-text)
nmap        S   <Plug>(vsnip-cut-text)
xmap        S   <Plug>(vsnip-cut-text)

" If you want to use snippet for multiple filetypes, you can `g:vsnip_filetypes` for it.
let g:vsnip_filetypes = {}
let g:vsnip_filetypes.javascriptreact = ['javascript']
let g:vsnip_filetypes.typescriptreact = ['typescript']


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ctrl-p config 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_map = '<C-P>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <leader>p :CtrlPBuffer<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" lsp config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
lua << EOF

vim.o.completeopt = "menu,menuone,noselect"

local cmp = require 'cmp'
cmp.setup({
  snippet = {
    expand = function(args)
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = {
    ['<C-p>'] = cmp.mapping.select_prev_item(),
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.close(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
      },
    ['<Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'vsnip' },
  }, {
    { name = 'buffer' },
  })
})

 cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})


--Enable (broadcasting) snippet capability for completion
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
require'lspconfig'.pyright.setup{
  capabilities = capabilities,
}
require'lspconfig'.tsserver.setup{
  capabilities = capabilities,
}
require'lspconfig'.clangd.setup{
  capabilities = capabilities,
}
require'lspconfig'.html.setup {
  capabilities = capabilities,
}
require'lspconfig'.cssls.setup {
  capabilities = capabilities,
}

EOF

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gD <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gi <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> K <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> <C-K> <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> <C-S-N> <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> <C-N> <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> <leader>rn <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>ca <cmd>lua vim.lsp.buf.code_action()<CR>
nnoremap <silent> <leader>ff <cmd>lua vim.lsp.buf.formatting()<CR>

" auto-format
autocmd BufWritePre *.js lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.jsx lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.py lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.c lua vim.lsp.buf.formatting_sync(nil, 100)
autocmd BufWritePre *.cpp lua vim.lsp.buf.formatting_sync(nil, 100)
