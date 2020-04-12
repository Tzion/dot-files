" Smart preview in quickfix list
 augroup qfpreview
   autocmd!
   autocmd FileType qf nmap <buffer> p <plug>(qf-preview-open)
 augroup END

 " Search in all proejct (vimgrep), jump to first result and open quickfix list
 noremap <expr> <Leader>f ":vimgrep /".input("Find Everywhere: ")."/ **\<ESC>:          copen<CR>"

 " cscope find of word under cursor - results in quickfix:
 noremap <leader>cc :cscope find c <cword><CR> :copen<CR>
 noremap <leader>cd :cscope find d <cword><CR> :copen<CR>
 noremap <leader>cg :cscope find g <cword><CR> :copen<CR>
 noremap <leader>ca :cscope find a <cword><CR> :copen<CR>
 noremap <leader>cs :cscope find s <cword><CR> :copen<CR>
 noremap <leader>cf :cscope find f <cword><CR>
 set cscopequickfix=c-,d-,g-,a-,s-,    " Insert cscope find results to quicklist after  clear previos results
 nnoremap <tab>j <c-w>j
 nnoremap <tab>k <c-w>k
 nnoremap <tab>l <c-w>l
 nnoremap <tab>h <c-w>h
 nnoremap <space> <c-d>
 nnoremap qqq :q<CR>
