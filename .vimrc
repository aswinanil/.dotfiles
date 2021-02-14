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
Plug 'thirtythreeforty/lessspace.vim'
Plug 'tpope/vim-vinegar'
Plug 'airblade/vim-gitgutter'
Plug 'yggdroot/indentline'
Plug 'tpope/vim-commentary'
" Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'justinmk/vim-sneak'
" Plug 'tmsvg/pear-tree'  " need find alternative style
Plug 'vim-airline/vim-airline'
" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'jiangmiao/auto-pairs'
" Plug 'tpope/vim-fugitive'
Plug 'mustache/vim-mustache-handlebars'
" Plug 'fholgado/minibufexpl.vim'
" Plug 'jeetsukumaran/vim-buffergator'
Plug 'vim-scripts/bufexplorer.zip'

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
set clipboard=unnamedplus
set bs=2
set breakindent
set hlsearch
" set undofile
" set undodir=/Users/aswin/.vim/undohistory/
set foldmethod=indent
set foldnestmax=10
set foldlevelstart=10
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
set wildignore+=*\\tmp\\*,*.swp,*.zip,*.exe  " Windows
set timeoutlen=1000 ttimeoutlen=0
set background=dark
set virtualedit=all

highlight Comment cterm=italic

let g:indentLine_color_term=244
let g:limelight_conceal_ctermfg=243
let mapleader=" "
let g:airline_extensions = []
let g:netrw_altfile = 1
" let g:airline_powerline_fonts=1

nnoremap <leader>w :update<CR>
nnoremap <leader>q :q<CR>
nnoremap <leader>Q :qa<CR>
nnoremap <leader>r :e!<CR>
nnoremap <leader>D :w !diff % -<CR>
" nnoremap <leader>l :Ls<CR>
nnoremap <leader>l :BufExplorer<CR>
nnoremap <leader>a :bad ./
nnoremap <leader>e :e ./
nnoremap <leader>E :e<space>
nnoremap <leader>m :marks<CR>
nnoremap <leader>v <C-w>H
nnoremap <leader>h <C-w>K
nnoremap <leader>F :let @+ = expand("%:p")<CR>
nnoremap <leader>g :g/
nnoremap <leader>f :FZF<CR>
nnoremap <leader>C o<Esc>ccconsole.log();<Esc>F)i
nnoremap <leader>c o<Esc>ccconsole.log("");<Esc>F"i
nnoremap <leader>d o<CR><Esc>ccdebugger;<Esc>o<Esc>k0

nnoremap <leader>b :b<space>
nnoremap <leader>, :b #<CR>
" nnoremap <leader>D :bd *<C-a><CR>:b #<CR>
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
noremap <silent> <leader>j :call AddEmptyLineBelow()<CR>
noremap <silent> <leader>k :call AddEmptyLineAbove()<CR>
noremap <silent> <leader><CR> i<CR><Esc>k$
" nnoremap <leader>n :delmarks A-Z0-9<CR>
" nnoremap <leader>s :source ~/.vimrc<CR>

" select just pasted text
noremap <expr> <leader>p '`[' . strpart(getregtype(), 0, 1) . '`]'

nnoremap <BS> X
nnoremap <C-p> "0p
vnoremap <C-p> "0p

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

" move to beginning of line
nnoremap H ^
nnoremap L $
vnoremap H ^
vnoremap L $

nnoremap M M0
nnoremap <c-G> Gzz

" page navigation should shift cursor to start of line
nnoremap <C-u> <C-u>
nnoremap <C-d> <C-d>
nnoremap <C-b> <C-b>M0
nnoremap <C-f> <C-f>M0

nnoremap zt ztM0
nnoremap zb zbM0

nnoremap <F10> <C-f>M0
nnoremap <F11> <C-b>M0

nnoremap <F1> 7<C-e>7j
nnoremap <F2> 7<C-y>7k
nnoremap <F3> <C-e>j
nnoremap <F4> <C-y>k

nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-h> <left>
inoremap <C-l> <right>

" inoremap <F8> <down>
" inoremap <F9> <up>
" inoremap <F7> <left>
" inoremap <F10> <right>

" centre text when searching
nnoremap n nzz
nnoremap N Nzz

" nnoremap # #zz
" nnoremap * *zz

" highlights
nnoremap _ *<C-o>
nnoremap ) :set hlsearch<CR>
nnoremap + :nohlsearch<CR>

nnoremap <NUL> i<space><esc>
nnoremap I i <Esc>r

autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!
autocmd VimResized * exe "normal! \<c-w>="

" *** COMMANDS ***

command! -bang Ls redir @" | silent ls<bang> | redir END | echo " " |
\ perl {
\ my $msg=VIM::Eval('@"');
\ my %list=();
\ my $key, $value;
\ while($msg =~ m/(.*?line\s+\d+)/g)
\ {
\ $value = $1;
\ $value =~ m/"([^"]+)"/;
\ $key = $1;
\ ($^O =~ /mswin/i) and $key = lc($key);
\ $list{$key} = $value;
\ }
\ my $msg = '';
\ for $key (sort keys %list)
\ {
\ $msg .= "$list{$key}\n";
\ }
\ VIM::Msg($msg);
\ }
\ <CR>

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

autocmd BufEnter * call SetTerminalTitle()

" FZF
" command! FZFMru call fzf#run({
" \  'source':  v:oldfiles,
" \  'sink':    'e',
" \  'options': '-m -x +s',
" \  'down':    '40%'})

" command! FZFMru call fzf#run({
" \ 'source':  reverse(s:all_files()),
" \ 'sink':    'edit',
" \ 'options': '-m -x +s',
" \ 'down':    '40%' })

" function! s:all_files()
"   return extend(
"   \ filter(copy(v:oldfiles),
"   \        "v:val !~ 'fugitive:\\|NERD_tree\\|^/tmp/\\|.git/'"),
"   \ map(filter(range(1, bufnr('$')), 'buflisted(v:val)'), 'bufname(v:val)'))
" endfunction
