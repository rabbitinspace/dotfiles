" Coc specific settings

" use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" use <leader>sr for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <leader>sr <Plug>(coc-range-select)
xmap <silent> <leader>sr <Plug>(coc-range-select)

" use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" using CocList
" show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>

" find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>
" yank history
nnoremap <silent> <space>y  :<C-u>CocList -A --normal yank<cr>
" files list
nnoremap <silent> <space>f  :<C-u>CocList files<cr>
" buffers list
nnoremap <silent> <space>b  :<C-u>CocList buffers<cr>
" scroll floating window
nnoremap <expr><C-f> coc#util#has_float() ? coc#util#float_scroll(1) : "\<C-f>"
nnoremap <expr><C-b> coc#util#has_float() ? coc#util#float_scroll(0) : "\<C-b>"
