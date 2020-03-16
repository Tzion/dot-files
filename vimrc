filetype plugin indent on

set autoread                          " Auto reload changed files
set wildmenu                          " Tab autocomplete in command mode
set wildmode=longest:full,full        " Autocomplete - first <Tab> press - complete the longest match and pop wildmenu, second press - swipe between the options
set backspace=indent,eol,start        " http://vi.stackexchange.com/a/2163
set clipboard=unnamed                 " Clipboard support (OSX)
set laststatus=2                      " Show status line on startup
set splitright                        " Open new splits to the right
set splitbelow                        " Open new splits to the bottom
set lazyredraw                        " Reduce the redraw frequency
set ttyfast                           " Send more characters in fast terminals
set nowrap                            " Don't wrap long lines
set listchars=extends:→               " Show arrow if line continues rightwards
set listchars+=precedes:←             " Show arrow if line continues leftwards
set nobackup nowritebackup noswapfile " Turn off backup files
set noerrorbells novisualbell         " Turn off visual and audible bells
set expandtab shiftwidth=2 tabstop=2  " Two spaces for tabs everywhere
set history=500
set hlsearch                          " Highlight search results
set ignorecase smartcase              " Search queries intelligently set case
set incsearch                         " Show search results as you type
set timeoutlen=1000 ttimeoutlen=0     " Remove timeout when hitting escape
set showcmd                           " Show size of visual selection
set number                            " Show line numbers
set cursorline                        "  Highlight the text line of the cursor with CursorLine hl-CursorLine

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000
" Ignored files/directories from autocomplete (and CtrlP)
set wildignore+=*/tmp/*
set wildignore+=*.so
set wildignore+=*.zip
set wildignore+=*/vendor/bundle/*
set wildignore+=*/node_modules/

set wildignore+=*/cscope.out
set wildignore+=*/tags

autocmd VimEnter * if filereadable('tags') | execute "set tags=tags" |endif                "auto set tags on startup
autocmd VimEnter * if filereadable('cscope.out') | execute "cscope add cscope.out" |endif  "auto add cscope on startup
  " Highlight word under cursor when it holds for more than 250ms
set updatetime=250
autocmd CursorHold * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

"-------------------------------------------------------------------------------
"" Colors & Formatting
"-------------------------------------------------------------------------------

syntax on
colorscheme xcodedark
set background=dark
hi StatusLine ctermbg=blue ctermfg=green
hi WildMenu ctermfg=blue ctermbg=green
hi StatusLineNC ctermfg=green
hi Search ctermbg=yellow ctermfg=black


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
Plug 'majutsushi/tagbar'
Plug 'gabesoft/vim-ags'
Plug 'hari-rangarajan/CCTree'
Plug 'vim-airline/vim-airline'
Plug 'yssl/QFEnter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'w0rp/ale'
"Plug 'valloric/youcompleteme', { 'do': './install.py --clang-completer' }
Plug 'camspiers/animate.vim'  " Animation for windows movments when using lens
Plug 'camspiers/lens.vim' "Automatically resizes windows
Plug 'liuchengxu/vista.vim' "View and search LSP symbols, tags
Plug 'airblade/vim-gitgutter' "Show git diff and more git stuff
Plug 'shougo/neocomplete.vim' "Auto completetion pluging
Plug 'bfrg/vim-qf-preview'
call plug#end()

"-------------------------------------------------------------------------------
"" Plugins preferences
"-------------------------------------------------------------------------------
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

"------------------------------------------------------------------------------
"" Key Bindings
"-----------------------------------------------------------------------------
nmap <F8> :TagbarToggle<CR>
map <F6>  :NERDTreeToggle<CR>

" Smart preview in quickfix list
noremap <expr> p &buftype==# 'quickfix' ? "\<CR><C-W><C-W>" : 'p'
map <expr> J &buftype==# 'quickfix' ? 'jp' : 'J'
map <expr> K &buftype==# 'quickfix' ? 'kp' : 'J'

" Search in all proejct (vimgrep), jump to first result and open quickfix list
noremap <expr> <Leader>f ":vimgrep /".input("Find Everywhere: ")."/ **\<ESC>:copen<CR>"

" cscope find of word under cursor - results in quickfix:
noremap <leader>cc :cscope find c <cword><CR> :copen<CR>
noremap <leader>cd :cscope find d <cword><CR> :copen<CR>
noremap <leader>cg :cscope find g <cword><CR> :copen<CR>
noremap <leader>ca :cscope find a <cword><CR> :copen<CR>
noremap <leader>cs :cscope find s <cword><CR> :copen<CR>
set cscopequickfix=c-,d-,g-,a-,s-    " Insert cscope find results to quicklist after clear previos results
