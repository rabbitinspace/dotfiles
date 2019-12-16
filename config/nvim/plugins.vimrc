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

" Autoclose brackets
Plug 'jiangmiao/auto-pairs'

" Color scheme
Plug 'sainnhe/edge'

call plug#end()
