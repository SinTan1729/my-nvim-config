" This file lists all the global keymaps

" Set K to hover
command -nargs=+ LspHover lua vim.lsp.buf.hover()
set keywordprg=:LspHover

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Change the leader and localleader
let mapleader=","
let maplocalleader=';'

" Use ,dd for deleting without putting into buffer
nnoremap <leader>d "_d
nnoremap <leader>D "_D
nnoremap <leader>x "_x
vnoremap <leader>d "_d

" Insert a newline in normal mode by ,o
nnoremap <leader>o o<Esc>k
nnoremap <leader>O O<Esc>j

" Use ,u for redo
nnoremap <leader>u <c-r>

" Find files using fzf by ,f
nnoremap <leader>f :Files<CR>

" Move around buffers using ,j and ,k
nnoremap <leader>k :bnext<CR>
nnoremap <leader>k :bprevious<CR>

