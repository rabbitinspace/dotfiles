" Plugins configuration

call plug#begin(stdpath('data') . '/plugged')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'liuchengxu/vim-clap', { 'do': function('clap#helper#build_all') }
Plug 'itchyny/lightline.vim'

Plug 'sheerun/vim-polyglot'
Plug 'jiangmiao/auto-pairs'

Plug 'sainnhe/edge'

call plug#end()
