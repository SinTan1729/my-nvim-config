" Automatically start continuous compilation
" augroup vimtex_config
"     autocmd User VimtexEventInitPost VimtexCompile
" augroup END

" Enable languagetool support using YaLafi
let g:vimtex_grammar_vlty = {'lt_command': 'languagetool'}
set spelllang=en_us

" Compile once by \lo
augroup vimrc_tex
  autocmd!
  autocmd FileType tex nnoremap <buffer> <localleader>lo :silent VimtexCompileSS<CR>
augroup END

" Enable word wrapping for tex files
" autocmd FileType tex :set wrap
autocmd FileType tex :set linebreak
autocmd FileType tex :set tw=140

" Use zathura with vimtex, the zathura_simple one makes synctex work in
" Wayland
let g:vimtex_view_method = 'zathura_simple'

" Use a temporary directory for aux files
let g:vimtex_compiler_latexmk = { 'aux_dir' : '/tmp/latexmk' }

