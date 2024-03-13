" Auto install vim-plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Load plugins via vim-plug
call plug#begin()
  " airline related plugins
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  " Auto commenting per filetype
  Plug 'numToStr/Comment.nvim'
  " Give option to save files using sudo, if needed
  Plug 'lambdalisue/suda.vim'
  " Auto toggle for number mode when vim isn't focused
  Plug 'sitiom/nvim-numbertoggle'
  " Plugin for lean
  Plug 'julian/lean.nvim'
  " LSP related plugins
  Plug 'neovim/nvim-lspconfig'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'hrsh7th/nvim-cmp'        " For LSP completion
  Plug 'hrsh7th/cmp-nvim-lsp'
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-omni'        " For LaTeX completion
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'SirVer/ultisnips'        " For snippets
  " Support programming terms
  Plug 'psliwka/vim-dirtytalk', { 'do': ':let &rtp = &rtp \| DirtytalkUpdate' }
  " vim-moonfly theme
  Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }
  " Rust tools
  Plug 'simrat39/rust-tools.nvim'
  " Automatically add bracket pairs
  Plug 'windwp/nvim-autopairs'
  " Syntax highlighting for Fish scripts
  Plug 'khaveesh/vim-fish-syntax'
  " Plugin for LaTeX
  Plug 'lervag/vimtex'
  " Formatter
  Plug 'stevearc/conform.nvim'
  " For Searching
  Plug 'junegunn/fzf.vim'
call plug#end()

