" set foldmethod=expr
set nofoldenable
set conceallevel=2

let g:vim_markdown_strikethrough=1
let g:vim_markdown_toc_autofit=1

autocmd VimEnter * Goyo
nnoremap <leader>t :Toc<return>
nnoremap <leader>q :qa<return>

" close Toc after selecting header
nnoremap <expr><enter> &ft=="qf" ? "<cr>:lcl<cr>" : (getpos(".")[2]==1 ? "i<cr><esc>": "i<cr><esc>l")
