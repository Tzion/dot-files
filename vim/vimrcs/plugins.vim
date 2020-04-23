"-------------------------------------------------------------------------------
"" Plugins
"-------------------------------------------------------------------------------
"first install Vim-Plug plugins manager
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
call plug#begin('~/.vim/plugged')
Plug 'preservim/nerdtree'
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'majutsushi/tagbar' " browse the tags of the current file, overview of its structure
Plug 'gabesoft/vim-ags'
Plug 'hari-rangarajan/CCTree'
Plug 'vim-airline/vim-airline'
Plug 'yssl/QFEnter'
Plug 'ludovicchabant/vim-gutentags' " Seemless and auto tags management (dependent on ctags)
Plug 'skywind3000/gutentags_plus' " helps gutentags to show better results using gtags (depented on gtags)
Plug 'w0rp/ale'
"Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer' }
Plug 'camspiers/lens.vim' "Automatically resizes windows
Plug 'camspiers/animate.vim'  " Animation for windows movments when using lens
Plug 'liuchengxu/vista.vim' "View and search LSP symbols, tags
Plug 'airblade/vim-gitgutter' "Show git diff and more git stuff
Plug 'shougo/neocomplete.vim' "Auto completetion pluging
Plug 'bfrg/vim-qf-preview'
Plug 'python-mode/python-mode', { 'for': 'python', 'branch': 'develop' }
Plug 'pechorin/any-jump.vim'  " go-to-definition/find-references

 " language server protocols
Plug 'autozimu/LanguageClient-neovim', {'branch': 'next', 'do': 'bash install.sh', }
" other plugin - TODO try later
""Plug 'prabirshrestha/async.vim'
""Plug 'prabirshrestha/vim-lsp'
call plug#end()


"-------------------------------------------------------------------------------
"" Plugins preferences
"-------------------------------------------------------------------------------

 " LanguageClient-neovim
" Required for operations modifying multiple buffers like rename.
set hidden

let g:LanguageClient_serverCommands = {
    \ 'rust': ['~/.cargo/bin/rustup', 'run', 'stable', 'rls'],
    \ 'javascript': ['/usr/local/bin/javascript-typescript-stdio'],
    \ 'javascript.jsx': ['tcp://127.0.0.1:2089'],
    \ 'python': ['/usr/local/bin/pyls'],
    \ 'ruby': ['~/.rbenv/shims/solargraph', 'stdio'],
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>
" Or map each action separately
nnoremap ,h :call LanguageClient#textDocument_hover()<CR>
nnoremap ,d :call LanguageClient#textDocument_definition()<CR>
nnoremap ,td :call LanguageClient#textDocument_typeDefinition()<CR>
nnoremap ,i :call LanguageClient#textDocument_implementation()<CR>
nnoremap ,r :call LanguageClient#textDocument_references()<CR>
nnoremap ,s :call LanguageClient#workspace_symbol()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>

" second plugin - todo try later
""if executable('pyls')
""    " pip install python-language-server
""    au User lsp_setup call lsp#register_server({
""        \ 'name': 'pyls',
""        \ 'cmd': {server_info->['pyls']},
""        \ 'whitelist': ['python'],
""        \ })
""endif
""
""function! s:on_lsp_buffer_enabled() abort
""    setlocal omnifunc=lsp#complete
""    setlocal signcolumn=yes
""    nmap <buffer> gd <plug>(lsp-definition)
""    nmap <buffer> <f2> <plug>(lsp-rename)
""    " refer to doc to add more commands
""endfunction
""
""augroup lsp_install
""    au!
""    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
""    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
""augroup END
""


 " gutentags_plus
let g:gutentags_modules = ['ctags', 'gtags_cscope'] " use ctags and  gtags module
let g:gutentags_project_root = ['.root'] " config project root markers.
let g:gutentags_cache_dir = expand('~/.cache/tags') " generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_plus_switch = 1 " change focus to quickfix window after search (optional).
let g:gutentags_define_advanced_commands = 1 " debugging commands: GutentagsToggleEnabled and GutentagsToggleTrace

" CCTree
autocmd VimEnter * if filereadable('cscope.out') | execute "CCTreeLoadDB cscope.out" | endif         "auto load CCTree on startup
let g:CCTreeRecursiveDepth=0  " CCTree shows in default first degree callers/callee

" vim-qf-preview
"
let g:qfpreview = {'height': '22', 'offset':'1', 'number': 1, 'sign': {'text': '>>', 'texthl': 'Search'}}

" NERDTree
let g:NERDTreeWinSize=23

" Ag shortcut mappings
" Search for the word under cursor
nnoremap <Leader>s :Ags<Space><C-R>=expand('<cword>')<CR><CR>
" Search for the visually selected text
vnoremap <Leader>s y:Ags<Space><C-R>='"' . escape(@", '"*?()[]{}.') . '"'<CR><CR>
" Run Ags
nnoremap <Leader>a :Ags<Space>
" Quit Ags
nnoremap <Leader><Leader>a :AgsQuit<CR>
autocmd VimEnter * :NeoCompleteEnable
let g:gitgutter_preview_win_floating = 1


nmap <F8> :TagbarToggle<CR>
map <F6>  :NERDTreeToggle<CR>
map <F7> :Vista!!<CR>

