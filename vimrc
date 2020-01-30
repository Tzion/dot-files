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

"-------------------------------------------------------------------------------
"" Colors & Formatting
"-------------------------------------------------------------------------------

syntax on
colorscheme xcodedark
set background=dark
hi StatusLine ctermbg=blue ctermfg=green
hi StatusLineNC ctermfg=green

" Showcase comments in italics
"highlight Comment cterm=italic gui=italic


"-------------------------------------------------------------------------------
"" Plugins
"-------------------------------------------------------------------------------
set runtimepath^=~/.vim/bundle/nerdtree
set runtimepath^=~/.vim/bundle/ctrlp.vim
set rtp+=~/.fzf " Doesn't work
set rtp+=/.fzf/plugin/fzf.vim " Doesn't work
set rtp^=~/.vim/bundle/taglist.vim

"------------------------------------------------------------------------------
"" Key Bindings
"-----------------------------------------------------------------------------
nmap <F8> :TlistToggle<CR>

" Smart preview in quickfix list
noremap <expr> p &buftype==# 'quickfix' ? "\<CR><C-W><C-W>" : 'p'
map <expr> J &buftype==# 'quickfix' ? 'jp' : 'J'
map <expr> K &buftype==# 'quickfix' ? 'kp' : 'J'

" Search in all proejct (vimgrep), jump to first result and open quickfix list
noremap <expr> <Leader>f ":vimgrep /".input("Find Everywhere: ")."/ **\<ESC>:copen<CR>"

" cscope find of word under cursor - results in quickfix:
noremap <leader>csc :cscope find c <cword><CR> :copen<CR>
noremap <leader>csd :cscope find d <cword><CR> :copen<CR>
noremap <leader>csg :cscope find g <cword><CR> :copen<CR>
set cscopequickfix=c-,d-,g-    " Insert cscope find results to quicklist after clear previos results
