" Plugins configuration

call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'liuchengxu/vista.vim'
Plug 'itchyny/lightline.vim'

call plug#end()
