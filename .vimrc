if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-fugitive'
Plug 'thirtythreeforty/lessspace.vim'
Plug 'mustache/vim-mustache-handlebars'
Plug 'tpope/vim-vinegar'
Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-commentary'
Plug '/usr/local/opt/fzf'
Plug 'justinmk/vim-sneak'
Plug 'tmsvg/pear-tree'
"Plug 'ctrlpvim/ctrlp.vim'
"Plug 'jiangmiao/auto-pairs'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

syntax enable

set number
set t_Co=256
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent
set smartindent
set ignorecase
set incsearch
set clipboard=unnamed
set bs=2
set breakindent
set hlsearch
set undofile
set undodir=/Users/aswin/.vim/undohistory/
set foldmethod=indent
set foldnestmax=10
set foldlevel=2
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
:set virtualedit=all

let g:indentLine_color_term=244
let g:airline_powerline_fonts=1
let g:limelight_conceal_ctermfg=243
let mapleader=" "

nnoremap <leader>s :source ~/.vimrc<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>
nnoremap <leader>r :e!<CR>
nnoremap <leader>d :w !diff % -<CR>
nnoremap <leader>l :ls<CR>
nnoremap <leader>a :bad ./
nnoremap <leader>e :e ./
nnoremap <leader>m :marks<CR>
nnoremap <leader>v <C-w>H
nnoremap <leader>h <C-w>K
nnoremap <leader>p :let @+ = expand("%:p")<CR>
nnoremap <leader>g :g/
nnoremap <leader>f :FZF<CR>

nnoremap <leader>b :b<space>
nnoremap <leader>, :b #<CR>
nnoremap <leader>D :bd<space>
nnoremap <leader>1 :b 1<CR>
nnoremap <leader>2 :b 2<CR>
nnoremap <leader>3 :b 3<CR>
nnoremap <leader>4 :b 4<CR>
nnoremap <leader>5 :b 5<CR>
nnoremap <leader>6 :b 6<CR>
nnoremap <leader>7 :b 7<CR>
nnoremap <leader>8 :b 8<CR>
nnoremap <leader>9 :b 9<CR>
nnoremap <leader>0 :b 1
" nnoremap <leader>n :delmarks A-Z0-9<CR>
" select just pasted text
noremap <expr> <leader>P '`[' . strpart(getregtype(), 0, 1) . '`]'

" TODO: add shortcut for inserting character without replacing

" saving
nnoremap <F1> :update<CR>

nnoremap <BS> X
nnoremap ) "0p
vnoremap ) "0p

" move vertically by visual line
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" move by few lines
nnoremap J 7gj
nnoremap K 7gk
vnoremap J 7gj
vnoremap K 7gk

nnoremap M M0
nnoremap G Gzz

" page navigation should shift cursor to start of line
nnoremap <C-u> <C-u>
nnoremap <C-d> <C-d>
nnoremap <C-b> <C-b>M0
nnoremap <C-f> <C-f>M0

nnoremap zt ztM0
nnoremap zb zbM0

nnoremap # #zz
nnoremap * *zz

nnoremap <F8> <C-f>M0
nnoremap <F9> <C-b>M0

nnoremap <F2> <C-e>j
nnoremap <F3> 7<C-e>7j
nnoremap <F4> 7<C-y>7k
nnoremap <F5> <C-y>k

nnoremap <C-j> <C-e>j
nnoremap <C-k> <C-y>k

inoremap <F8> <down>
inoremap <F9> <up>
inoremap <F7> <left>
inoremap <F10> <right>

" move to beginning of line
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

" centre text when searching
nnoremap n nzz
nnoremap N Nzz

" search curr word without jump
nnoremap _ *``

nnoremap + :set hlsearch<CR>
nnoremap = :nohlsearch<CR>

nnoremap <NUL> i<space><esc>
nnoremap <C-i> i <Esc>r

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!


" *** FUNCTIONS ***

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

" view unsaved changes
function! s:DiffWithSaved()
  let filetype=&ft
  diffthis
  vnew | r # | normal! 1Gdd
  diffthis
  exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! Diffu call s:DiffWithSaved()

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

noremap <silent> <C-h> :call AddEmptyLineBelow()<CR>
noremap <silent> <C-l> :call AddEmptyLineAbove()<CR>
autocmd BufEnter * call SetTerminalTitle()
