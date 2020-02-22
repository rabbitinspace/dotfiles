" Plugins configuration

call plug#begin(stdpath('data') . '/plugged')

" Multilanguage support
Plug 'sheerun/vim-polyglot'

" Command pallete
Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }

" Highlight yanked text
Plug 'machakann/vim-highlightedyank'

" Status line
Plug 'itchyny/lightline.vim'

" Git changes on left side
Plug 'mhinz/vim-signify'

" Color scheme
Plug 'sainnhe/edge'

call plug#end()


" ===========================================
" edge
" ===========================================
let g:edge_style = 'neon'
let g:edge_disable_italic_comment = 1
" ===========================================

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
      \ 'colorscheme': 'edge',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ] ]
      \ },
      \ }

" ===========================================
