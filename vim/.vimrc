"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Joseph Edward Morgan
""" .vimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Vundle Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" Vundle Plugin Manager
Plugin 'VundleVim/Vundle.vim'

" Shows useful information via bars above and below buffer
Plugin 'vim-airline/vim-airline'
Plugin 'powerline/fonts'
Plugin 'vim-airline/vim-airline-themes'

" File Manager within vim
Plugin 'scrooloose/nerdtree'
Plugin 'PhilRunninger/nerdtree-visual-selection'

" Fuzzy file opener
Plugin 'ctrlpvim/ctrlp.vim'

" Opens window to show tags in a file
Plugin 'majutsushi/tagbar'

" Intuitive navigation, alternative to hjkl keys
Plugin 'easymotion/vim-easymotion'

" Vim/tmux integration- Use hjkl to switch panes
Plugin 'christoomey/vim-tmux-navigator'

" Insanely good tab code completion
Plugin 'ycm-core/YouCompleteMe'
" Plugin 'rdnetto/YCM-Generator'

" Advaned syntax highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'

" Smart commenting
Plugin 'scrooloose/nerdcommenter'

" Smooth Scrolling
Plugin 'terryma/vim-smooth-scroll'

" Easy moving of highlighted blocks
Plugin 'matze/vim-move'

" Automatically close brackets
Plugin 'jiangmiao/auto-pairs'

" Vim with Latex
Plugin 'lervag/vimtex'

" Abbreviation Expander
Plugin 'mattn/emmet-vim'

" Vim Snippets
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'

" Bootstrap Snippets
Plugin 'jvanja/vim-bootstrap4-snippets'

" Improved Javascript syntax highlighting and indentation
Plugin 'pangloss/vim-javascript'
Plugin 'briancollins/vim-jst'

" Cool Icons
Plugin 'ryanoasis/vim-devicons'

" Some colorschemes - ymmv
Plugin 'nanotech/jellybeans.vim'
Plugin 'dracula/vim'
Plugin 'altercation/vim-colors-solarized'

call vundle#end()
filetype plugin indent on


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" General .vimrc config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let mapleader = "\<Space>"

func! WordProcessor()
	map j gj
	map k gk
	setlocal formatoptions=1
	setlocal noexpandtab
	setlocal wrap
	setlocal linebreak
	setlocal spell spelllang=en_us
	set complete+=s
endfu
com! WP call WordProcessor()

set incsearch
set hlsearch
set guifont=Iosevka\ Nerd\ Font\ 11
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
set smartindent
set cinoptions=g0:0
set tabstop=4        " tab width is 2 spaces
set shiftwidth=4     " indent also with 2 spaces
set textwidth=0
set t_Co=256
set number
set showmatch
set nospell


highlight NonText ctermbg=none
highlight Normal ctermbg=none
highlight LineNr ctermbg=none
highlight VertSplit ctermbg=none

nnoremap <C-A-j> <c-w>j
nnoremap <C-A-k> <c-w>k
nnoremap <c-<Left>> <c-w>h
nnoremap <c-<Right>> <c-w>l

map <leader>t <C-W>}
nmap <leader>w :wa<CR>
nmap <leader>Q :wqa<CR>
nmap <leader>Q :wqa<CR>
nmap <leader>p :CtrlPBufTag<CR>
nmap <leader>/ :noh<CR>
map <leader>f :YcmCompleter FixIt<CR>

map <F4> :!ctags -R<CR><CR>
nnoremap <F5> = :YcmForceCompileAndDiagnostics<CR>
nnoremap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarTogglePause<CR>
set foldmethod=syntax
set foldlevel=1
set foldnestmax=1
" Workaround to prevent vim from unfolding everything
" after entering an opening brace
autocmd InsertEnter * if !exists('w:last_fdm') | let w:last_fdm=&foldmethod | setlocal foldmethod=manual | endif
autocmd InsertLeave,WinLeave * if exists('w:last_fdm') | let &l:foldmethod=w:last_fdm | unlet w:last_fdm | endif



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

" Close buffer, move to previous
nmap <leader>bq :bp <BAR> bd #<CR>

" Show all open buffers and their status
nmap <leader>bl :ls<CR>

let g:airline_powerline_fonts = 1

set laststatus=2



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" YouCompleteMe config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_global_ycm_extra_conf = '~/.dotfiles/utils/ycm_config.py'
let g:ycm_confirm_extra_conf = 0
set completeopt-=preview

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_use_clangd = "Always"
let g:ycm_clangd_binary_path = "/usr/bin/clangd"



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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" snippets config 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-l>"
let g:UltiSnipsJumpBackwardTrigger="<c-h>"



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" ctrl-p config 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
