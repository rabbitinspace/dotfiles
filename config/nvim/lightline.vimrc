" Configuration for lightline

set noshowmode
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Blue',
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
