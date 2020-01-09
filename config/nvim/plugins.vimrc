" Plugins configuration

call plug#begin(stdpath('data') . '/plugged')

" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" Multilanguage support
Plug 'sheerun/vim-polyglot'

" Tags browser
Plug 'liuchengxu/vista.vim'

" Command pallete
Plug 'liuchengxu/vim-clap', { 'do': function('clap#helper#build_all') }

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
" disable vim-go :GoDef short cut (gd)
" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0

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
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

" use auocmd to force lightline update.
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()
" ===========================================
