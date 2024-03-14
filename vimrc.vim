" Disable netrw for nvim-tree to work
" let loaded_netrw = 1
" let loaded_netrwPlugin = 1

" Turn on numbers
set number

" Turn off line wrapping
set nowrap

" Turn on syntax highlighting
syntax on
filetype plugin indent on

" Disable cmdline from bottom
set cmdheight=0

" Display as much of a line as possible instead of just showing @
set display+=lastline

" Ignore case while searching except when the search term contains capital letters
set ignorecase
set smartcase

" Use 4 spaces for tabs and properly adjust them for files using TAB
set tabstop=4
set shiftwidth=4
set expandtab

" Needed for group colors to work in nvim-tree
set termguicolors

" Show LSP signs in the number column
set signcolumn=number

" Turn on spell checking
set spell

" Enable mouse support
set mouse=n

" Set K to hover
command -nargs=+ LspHover lua vim.lsp.buf.hover()
set keywordprg=:LspHover

" Enable programming dictionary
set spelllang=en,programming

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Disable unused plugins
let g:loaded_perl_provider=0
let g:loaded_node_provider=0
let g:loaded_ruby_provider=0

" Change the leader and localleader
let mapleader = ","
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

" Load UltiSnips snippets from custom-snippets
let g:UltiSnipsSnippetDirectories=["custom-snippets", "UltiSnips"]

" Find files using fzf by ,f
nnoremap <leader>f :Files<CR>

