" Plugins configuration

call plug#begin(stdpath('data') . '/plugged')

" Multilanguage support
Plug 'sheerun/vim-polyglot'

" Highlight yanked text
Plug 'machakann/vim-highlightedyank'

" Status line
Plug 'itchyny/lightline.vim'

" Git changes on left side
Plug 'mhinz/vim-signify'

" Wal colors
Plug 'sprockmonty/wal.vim'

" Global colors
Plug 'arzg/vim-colors-xcode'

" Paren matching
Plug 'andymass/vim-matchup'

" Autoclose parens
Plug 'cohama/lexima.vim'

call plug#end()

" ===========================================
" vimgo
" ===========================================

" highlighting
let g:go_highlight_extra_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
" ===========================================

" ===========================================
" lightline
" ===========================================
let g:lightline = {
      \ 'colorscheme': 'wal',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ] ]
      \ },
      \ }

" ===========================================

" ===========================================
" vim-matchup
" ===========================================
let g:loaded_matchit = 1
" ===========================================

" ===========================================
" vim-signify
" ===========================================
let g:signify_sign_add    = '┃'
let g:signify_sign_change = '┃'
let g:signify_sign_delete = '•'

let g:signify_sign_show_count = 0
" ===========================================
