filetype plugin indent on

set nocompatible
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
let undodir_path = vim_path . "undo_dir/"
if !isdirectory(undodir_path)
    call mkdir(undodir_path, "", 0700)
endif
set undodir=undodir_path
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
"" Colors & UI
"-------------------------------------------------------------------------------

syntax on
colorscheme xcodedark
set background=dark
hi StatusLine ctermbg=blue ctermfg=green
hi WildMenu ctermfg=blue ctermbg=green
hi StatusLineNC ctermfg=green
hi Search ctermbg=yellow ctermfg=black


