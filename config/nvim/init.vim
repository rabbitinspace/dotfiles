" Configuration for nvim

" hide buffers instead of saving
set hidden

" disable backups (because of coc plugin)
set nobackup
set nowritebackup

" more space for messages (do I need it?)
set cmdheight=2

" coc plugin want this to display diagnostic messages early
set updatetime=300

" coc plugin want this
set shortmess+=c

" show info and line columns on the left
set signcolumn=yes
highlight clear signcolumn
set number

" spaces by default
setlocal et sw=4 sts=4 ts=8

" import children configs
" vimgo should be loaded before coc (or not, I don't know)
let $plugins = stdpath('config') . '/plugins.vimrc'
let $vimgo = stdpath('config') . '/vimgo.vimrc'
let $coc = stdpath('config') . '/coc.vimrc'
source $plugins
source $vimgo 
source $coc
