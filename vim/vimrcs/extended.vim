" open quickfix at bottom taking full space
autocmd FileType qf wincmd J

  " Search in all proejct (vimgrep), jump to first result and open quickfix list
noremap <expr> <Leader>f ":vimgrep /".input("Find Everywhere: ")."/ **\<ESC>:          copen<CR>"

  " Highlight word under cursor when it holds for more than 250ms
set updatetime=250
autocmd CursorHold * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" cscope 
  " cscope find of word under cursor - results in quickfix TODO if gutentags_plus does it better delete these mappings (use
" same keys)
 noremap <leader>cc :cscope find c <cword><CR> :copen<CR>
 noremap <leader>cd :cscope find d <cword><CR> :copen<CR>
 noremap <leader>cg :cscope find g <cword><CR> :copen<CR>
 noremap <leader>ca :cscope find a <cword><CR> :copen<CR>
 noremap <leader>cs :cscope find s <cword><CR> :copen<CR>
 noremap <leader>cf :cscope find f <cword><CR>
 set cscopequickfix=c-,d-,g-,a-,s-,    " Insert cscope find results to quicklist after  clear previos results

 
  " easy navigate between and inside windows
nnoremap <tab>j <c-w>j
nnoremap <tab>k <c-w>k
nnoremap <tab>l <c-w>l
nnoremap <tab>h <c-w>h

" down half screen
nnoremap <space> <c-d>
" easy swipe between recent windows
nnoremap  <tab><tab> <c-w>p

" Easy closing nearby windows
nnoremap Zj <c-w>jZZ
nnoremap Zk <c-w>kZZ
nnoremap Zl <c-w>lZZ
nnoremap Zh <c-w>hZZ

nnoremap <leader>l :buffers<CR>:buffer<space>
