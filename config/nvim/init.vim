" Configuration for nvim

" import children configs
let $plugins = stdpath('config') . '/plugins.vimrc'
let $netrw = stdpath('config') . '/netrw.vimrc'
source $plugins
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

" disable status
set noshowmode

" colors
set termguicolors
set background=dark
colorscheme wal
highlight link HighlightedyankRegion Search
exe 'hi CursorLine ctermbg=0 guibg='.g:color0.' ctermfg=NONE guifg=NONE'

" display diagnostic messages early
set updatetime=300

" unsure
set shortmess+=c

" show info and line columns on the left
set number
set signcolumn=yes
highlight clear signcolumn

" highlight current line
set cursorline

" spaces by default
set et sw=4 sts=4 ts=4

" clear last search patters by hitting ESC in normal mode
nnoremap <ESC> :noh<CR><ESC>

