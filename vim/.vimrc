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

" Fuzzy file opener
Plugin 'kien/ctrlp.vim'

" Opens window to show tags in a file
Plugin 'majutsushi/tagbar'

" Intuitive navigation, alternative to hjkl keys
Plugin 'easymotion/vim-easymotion'

" Vim/tmux integration- Use hjkl to switch panes
Plugin 'christoomey/vim-tmux-navigator'

" Insanely good tab code completion
Plugin 'Valloric/YouCompleteMe'

" Advaned syntax highlighting
Plugin 'octol/vim-cpp-enhanced-highlight'

" Smart commenting
Plugin 'scrooloose/nerdcommenter'

" Smooth Scrolling
Plugin 'terryma/vim-smooth-scroll'

" Easy moving of highlighted blocks
Plugin 'matze/vim-move'

" Automatically close brackets
" Plugin 'jiangmiao/auto-pairs'

" Vim with Latex
Plugin 'lervag/vimtex'

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

set comments=sl:/*,mb:\ *,elx:\ */
set formatoptions-=cro
set backspace=2
syntax on
set background=dark
colorscheme jellybeans
set enc=utf-8
set fenc=utf-8
set termencoding=utf-8
set ruler
set autoindent
set smartindent
set cinoptions=g0:0
set tabstop=2        " tab width is 2 spaces
set shiftwidth=2     " indent also with 2 spaces
set textwidth=0
set t_Co=256
set number
set showmatch
set nospell
highlight NonText ctermbg=none
highlight Normal ctermbg=none
highlight LineNr ctermbg=none
highlight VertSplit ctermbg=none

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

map <c-P> :CtrlPBufTag<CR>

map <leader>t <C-W>}
map <leader>p <C-W>z

nmap <leader>w :wa<CR>

map <F4> :!ctags -R<CR><CR>
nnoremap <F5> = :YcmForceCompileAndDiagnostics<CR>
nnoremap <F7> :NERDTreeToggle<CR>
nmap <F8> :TagbarToggle<CR>
nmap <F9> :TagbarTogglePause<CR>
map <F10> :YcmCompleter FixIt<CR>
set foldmethod=syntax
set foldlevel=0
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
""" Syntastic config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_cpp_checkers = ['gcc']
let g:syntastic_cpp_check_header = 1
let g:syntastic_auto_loc_list = 0

nmap <leader>e :Errors<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Tagbar Config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" YouCompleteMe config
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:ycm_global_ycm_extra_conf = '~/dev/cpp/.ycm_config'
let g:ycm_confirm_extra_conf = 0
set completeopt-=preview
" The ycmd server SHUT DOWN (restart with ':YcmRestartServer'). YCM core library compiled for Python 2 but loaded in Python 3. Set the 'g:ycm_server_python_interpreter'
let g:ycm_server_python_interpreter = "/usr/bin/python2"

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'



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



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" vimtex config 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:vimtex_view_general_viewer = '/usr/bin/zathura'
