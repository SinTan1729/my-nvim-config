" Change the leader to a comma
let mapleader = ","
let g:mapleader = ","

" Use ,dd for deleting without putting into buffer
nnoremap <leader>d "_d
nnoremap <leader>D "_D
nnoremap <leader>x "_x
vnoremap <leader>d "_d

" Insert a newline in normal mode by ,o
nnoremap <Leader>o o<Esc>k
nnoremap <Leader>O O<Esc>j

" Use ,u for redo
nnoremap <Leader>u <c-r>

