if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'junegunn/goyo.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'thirtythreeforty/lessspace.vim'
Plug 'mustache/vim-mustache-handlebars'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

let g:vim_markdown_strikethrough=1
let g:vim_markdown_toc_autofit = 1
let g:airline_powerline_fonts=1

let mapleader="-"
set t_Co=256

syntax enable
set number

set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set mouse+=i
set ignorecase
set incsearch
set clipboard=unnamed
set bs=2

nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <leader>w :update<CR>
nnoremap <leader>q :qa<CR>
nnoremap <leader>r :e!<CR>
nnoremap <leader>d :w !diff % -<CR>
nnoremap <leader>l :ls<CR>
nnoremap <leader>n :bn<CR>
nnoremap <leader>p :bp<CR>
nnoremap <leader>b :b
nnoremap <leader>d :bd
nnoremap <leader>a :bad
nnoremap <leader>e :e
" select just pasted text
noremap <expr> <leader>P '`[' . strpart(getregtype(), 0, 1) . '`]'

" move vertically by visual line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" move by few lines
nnoremap J 7j
nnoremap K 7k
vnoremap J 7j
vnoremap K 7k

" H M L should shift cursor to start of line
nnoremap H H0
nnoremap M M0
nnoremap L L0

" page navigation should shift cursor to start of line
nnoremap <C-u> <C-u>
nnoremap <C-d> <C-d>
nnoremap <C-b> <C-b>M0
nnoremap <C-f> <C-f>M0

nnoremap zt ztM0
nnoremap zb zbM0

nnoremap # #zz
nnoremap * *zz

" nnoremap <C-q> <C-e>
" nnoremap <C-w> <C-y>
nnoremap 1 <C-e>j
nnoremap 2 <C-y>k
nnoremap 3 7<C-e>7j
nnoremap 4 7<C-y>7k
nnoremap 8 <C-f>M0
nnoremap 9 <C-b>M0

" move to beginning of line
nnoremap ( ^
nnoremap ) $
vnoremap ( ^
vnoremap ) $

" centre text when searching
nnoremap n nzz
nnoremap N Nzz

set breakindent
set hlsearch

nnoremap <space> i<space><esc>
" nnoremap <return> i<return><esc>

" search curr word without jump
nnoremap _ *``

" toggle hightlight
" let hlstate=0
" nnoremap = :if (hlstate%2 == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=hlstate+1<cr>

nnoremap + :set hlsearch<CR>
nnoremap = :nohlsearch<CR>

:set virtualedit=all

" let &t_SI = "\<Esc>]50;CursorShape=1\x7"
" let &t_SR = "\<Esc>]50;CursorShape=2\x7"
" let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" set guicursor=n-v-c:block-Cursor
" set guicursor+=i:ver100-iCursor
" set guicursor+=n-v-c:blinkon0
" set guicursor+=i:blinkwait10

" set the title of the Terminal to the currently open file
function! SetTerminalTitle()
    let titleString = expand('%:t')
    if len(titleString) > 0
        let &titlestring = expand('%:t')
        " this is the format iTerm2 expects when setting the window title
        let args = "\033];".&titlestring."\007"
        let cmd = 'silent !echo -e "'.args.'"'
        execute cmd
        redraw!
    endif
endfunction

autocmd BufEnter * call SetTerminalTitle()
" autocmd InsertLeave * silent! update
set undofile
set undodir=/Users/aswin/.vim/undohistory/

" view unsaved changes
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Diffu call s:DiffWithSaved()

set foldmethod=indent
set foldnestmax=10
set foldlevel=2

function! AddEmptyLineBelow()
  call append(line("."), "")
endfunction

function! AddEmptyLineAbove()
  let l:scrolloffsave = &scrolloff
  " Avoid jerky scrolling with ^E at top of window
  set scrolloff=0
  call append(line(".") - 1, "")
  if winline() != winheight(0)
    silent normal! <C-e>
  end
  let &scrolloff = l:scrolloffsave
endfunction

noremap <silent> <C-j> :call AddEmptyLineBelow()<CR>
noremap <silent> <C-k> :call AddEmptyLineAbove()<CR>
