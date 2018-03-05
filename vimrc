" Original written for Debian GNU/Linux by W.Akkerman <wakkerma@debian.org>
" Some modifications by J.H.M. Dassen <jhm@cistron.nl>
" Possible further changes by Hubert Klasa 

syntax on
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"YOUR PLUGINS
"Plugin 'davidhalter/jedi-vim'
Plugin 'python-mode/python-mode'
Plugin 'ervandew/supertab'
"Plugin 'vim-syntastic/syntastic'

call vundle#end()            " required
filetype plugin indent on    " required


let base16colorspace=256  " Access colors present in 256 colorspace
let g:molokai_original = 1
let g:rehash256 = 1
colorscheme molokai

"Powertab now is looking from top
let g:SuperTabDefaultCompletionType = "<c-n>"
"if you prefer the Omni-Completion tip window to close when a selection is
"made, these lines close it on movement in insert mode or when leaving insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


set timeoutlen=1000
set ttimeoutlen=0
set nofoldenable    " disable folding
set shiftwidth=2
set showcmd		    " Show (partial) command in status line.
set backspace=2 " make backspace work like most other programs
set showmatch		" Show matching brackets.
set ignorecase		" Do case insensitive matching
set incsearch	    " Incremental search
set ruler           " show the cursor position all the time
set laststatus=2   " Always display the status line
"set autowrite		" Automatically save before commands like :next and :ma

let mapleader = ","
set nobackup
set nohlsearch
set expandtab 

set fenc=utf8
set enc=utf8

" When editing a file, always jump to the last known cursor position.
" Don't do it for commit messages, when the position is invalid, or when" inside an event handler (happens when dropping a file on gvim).
" inside an event handler (happens when dropping a file on gvim).
autocmd BufReadPost *
    \ if &ft != 'gitcommit' && line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 0
"let g:syntastic_check_on_wq = 1
"let g:syntastic_python_checkers=['pylint'] " using pylint or flake8
"let g:syntastic_python_checkers=['flake8'] " using pylint or flake8
"let g:syntastic_python_pylint_post_args="--max-line-length=120"
"let g:syntastic_python_flake8_args='--ignore=E501,E225'

inoremap <F3> <Esc>:w<CR>a
noremap <F3> :w<CR>i
set pastetoggle=<F2>

set tabstop=4
set number 
set numberwidth=5

function InsertTabWrapper()
      let col = col('.') - 1
      if !col || getline('.')[col - 1] !~ '\k'
          return "\<tab>"
      else
          return "\<c-p>"
      endif
endfunction

inoremap <tab> <c-r>=InsertTabWrapper()<cr>

au BufNewFile,BufRead *.frag,*.vert,*.fp,*.vp,*.glsl setf glsl 

autocmd bufreadpre *.c set colorcolumn=161
autocmd bufreadpre *.py set colorcolumn=161
autocmd bufreadpre *.cc set colorcolumn=161
autocmd bufreadpre *.cpp set colorcolumn=161
autocmd bufreadpre *.h set colorcolumn=161

autocmd bufreadpre *.c setlocal textwidth=160
autocmd bufreadpre *.py setlocal textwidth=160
autocmd bufreadpre *.cc setlocal textwidth=160
autocmd bufreadpre *.cpp setlocal textwidth=160
autocmd bufreadpre *.h setlocal textwidth=160

autocmd BufWritePre *.py :%s/\s\+$//e

autocmd VimEnter * nnoremap <silent> <c-j> :TmuxNavigateDown<cr>:redraw!<cr>
