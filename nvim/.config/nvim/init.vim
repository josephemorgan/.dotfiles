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
Plug 'hrsh7th/nvim-compe'

" IDE-like debugging
Plug 'puremourning/vimspector'

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
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Bootstrap Snippets
Plug 'jvanja/vim-bootstrap4-snippets'

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
" Workaround to prevent vim from unfolding everything
" after entering an opening brace

" see github.com/SirVer/utilisnips/issues/1202
if has('nvim')
  au VimEnter * if exists('#UltiSnips_AutoTrigger')
        \ |     exe 'au! UltiSnips_AutoTrigger'
        \ |     aug! UltiSnips_AutoTrigger
        \ | endif
endif


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
""" YouCompleteMe config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_global_ycm_extra_conf = '~/.dotfiles/utils/ycm_config.py'
let g:ycm_confirm_extra_conf = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" set completeopt-=preview

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_always_populate_location_list = 1
" let g:ycm_use_clangd = "Always"
" let g:ycm_clangd_binary_path = "/usr/bin/clangd"



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
let g:tex_flavor = 'latex'



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" snippets config 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"



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
require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{}
require'lspconfig'.clangd.setup{}

--Enable (broadcasting) snippet capability for completion
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

require'lspconfig'.html.setup {
  capabilities = capabilities,
  }

require'lspconfig'.cssls.setup {
  capabilities = capabilities,
  }

vim.o.completeopt = "menuone,noselect"

require'compe'.setup {
enabled = true;
autocomplete = true;
debug = false;
min_length = 1;
preselect = 'enable';
throttle_time = 80;
source_timeout = 200;
incomplete_delay = 400;
max_abbr_width = 100;
max_kind_width = 100;
max_menu_width = 100;
documentation = false;

source = {
  path = true;
  buffer = true;
  calc = true;
  vsnip = true;
  nvim_lsp = true;
  nvim_lua = true;
  spell = true;
  tags = true;
  snippets_nvim = true;
  treesitter = true;
  };
}
local t = function(str)
return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
local col = vim.fn.col('.') - 1
if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
  return true
else
  return false
end
end

-- Use (s-)tab to:
--- move to prev/next item in completion menuone
--- jump to prev/next snippet's placeholder
_G.tab_complete = function()
if vim.fn.pumvisible() == 1 then
  return t "<C-n>"
elseif vim.fn.call("vsnip#available", {1}) == 1 then
  return t "<Plug>(vsnip-expand-or-jump)"
elseif check_back_space() then
  return t "<Tab>"
else
  return vim.fn['compe#complete']()
end
end
_G.s_tab_complete = function()
if vim.fn.pumvisible() == 1 then
  return t "<C-p>"
elseif vim.fn.call("vsnip#jumpable", {-1}) == 1 then
  return t "<Plug>(vsnip-jump-prev)"
else
  -- If <S-Tab> is not working in your terminal, change it to <C-h>
  return t "<S-Tab>"
end
end

vim.api.nvim_set_keymap("i", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<Tab>", "v:lua.tab_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<S-Tab>", "v:lua.s_tab_complete()", {expr = true})

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
