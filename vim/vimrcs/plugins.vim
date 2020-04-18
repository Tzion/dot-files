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
call plug#end()

"-------------------------------------------------------------------------------
"" Plugins preferences
"-------------------------------------------------------------------------------
 " gutentags_plus
let g:gutentags_modules = ['ctags', 'gtags_cscope'] " use ctags and  gtags module
let g:gutentags_project_root = ['.root'] " config project root markers.
let g:gutentags_cache_dir = expand('~/.cache/tags') " generate datebases in my cache directory, prevent gtags files polluting my project
let g:gutentags_plus_switch = 1 " change focus to quickfix window after search (optional).
let g:gutentags_define_advanced_commands = 1 " debugging commands: GutentagsToggleEnabled and GutentagsToggleTrace

" CCTree
autocmd VimEnter * if filereadable('cscope.out') | execute "CCTreeLoadDB cscope.out" | endif         "auto load CCTree on startup
let g:CCTreeRecursiveDepth=0  " CCTree shows in default first degree callers/callee


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

