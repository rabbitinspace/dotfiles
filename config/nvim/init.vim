" Configuration for nvim

" import children configs
let $plugins = stdpath('config') . '/plugins.vimrc'
let $coc = stdpath('config') . '/coc.vimrc'
let $lightline = stdpath('config') . '/lightline.vimrc'
let $netrw = stdpath('config') . '/netrw.vimrc'
source $plugins
source $coc
source $lightline
source $netrw

" hide buffers instead of saving
set hidden

" flash screen instead of sound
set visualbell

" encoding
set encoding=utf-8
set fileencoding=utf-8

" better splits
set splitbelow
set splitright

" disable backups (because of coc plugin)
set nobackup
set nowritebackup

" use system clipboard
set clipboard=unnamedplus

" colors
set termguicolors
set background=dark
let g:edge_style = 'neon'
let g:edge_disable_italic_comment = 1
colorscheme edge

" more space for messages (do I need it?)
set cmdheight=2

" coc plugin want this to display diagnostic messages early
set updatetime=300

" coc plugin want this
set shortmess+=c

" show info and line columns on the left
set number
set signcolumn=yes
highlight clear signcolumn

" highlight current line
set cursorline

" spaces by default
setlocal et sw=4 sts=4 ts=4

