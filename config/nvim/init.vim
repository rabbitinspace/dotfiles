" Configuration for nvim

" import children configs
let $plugins = stdpath('config') . '/plugins.vimrc'
let $coc = stdpath('config') . '/coc.vimrc'
let $vimgo = stdpath('config') . '/vimgo.vimrc'
let $lightline = stdpath('config') . '/lightline.vimrc'
source $plugins
source $coc
source $vimgo 
source $lightline

" hide buffers instead of saving
set hidden

" flash screen instead of sound
set visualbell

" encoding
set encoding=utf-8
set fileencoding=utf-8

" disable backups (because of coc plugin)
set nobackup
set nowritebackup

" colors
set termguicolors
set background=dark
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

" spaces by default
setlocal et sw=4 sts=4 ts=4

