set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'rking/ag.vim'
Plugin 'godlygeek/tabular'
Plugin 'wincent/command-t'
Plugin 'scrooloose/nerdtree'
Plugin 'altercation/vim-colors-solarized'
Plugin 'ervandew/supertab'
Plugin 'airblade/vim-gitgutter'
Plugin 'tssm/fairyfloss.vim'
Plugin 'lilydjwg/colorizer'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

syntax enable
set encoding=utf-8

filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set nu                          " line numbers
set ruler
let mapleader = ","
let g:mapleader = ","
set hidden                      " allow Vim to manage multiple buffers effectively
set history=1000                " Keep a longer history
set wildmenu                    " Make file/command completion useful
set wildmode=list:longest       " complete only up to the point of ambiguity
set title
set shortmess=atI               " Stifle many interruptive prompts
set visualbell
set colorcolumn=80
set number                      " Show line numbers
set splitright                  " Split vertical windows right to the current windows
set splitbelow                  " Split horizontal windows below to the current windows
set encoding=utf-8              " Set default encoding to UTF-8
set autowrite                   " Automatically save before :next, :make etc.
au FocusLost * :wa              " Set vim to save the file on focus out.
set fileformats=unix,dos,mac    " Prefer Unix over Windows over OS 9 formats
set ttyfast
set lazyredraw                  " Wait to redraw "

"" Scrolling
set scrolloff=3
nnoremap <C-e> 3<C-e>
nnoremap <C-y> 3<C-y>

"" Setup global tmp dirs
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

"" Solarized settings
set background=dark
let g:solarized_termtrans = 1
colorscheme solarized
set termguicolors

"" Whitespace
set nowrap                      " don't wrap lines
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter
nmap <silent> <leader>n :silent :nohlsearch<CR>
" Remove search highlight
nnoremap <leader><space> :nohlsearch<CR>

" speed up syntax highlighting
set nocursorcolumn
set nocursorline

syntax sync minlines=256
set synmaxcol=300
set re=1

" open help vertically
command! -nargs=* -complete=help Help vertical belowright help <args>
autocmd FileType help wincmd L

" Make Vim to handle long lines nicely.
set textwidth=79
set formatoptions=qrn1

set autoindent
set complete-=i
set showmatch
set smarttab

set et
set tabstop=4
set shiftwidth=4
set expandtab

set nrformats-=octal
set shiftround

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
set notimeout
set ttimeout
set ttimeoutlen=10

" Better Completion
set complete=.,w,b,u,t
set completeopt=longest,menuone

if &history < 1000
  set history=50
endif

if &tabpagemax < 50
  set tabpagemax=50
endif

if !empty(&viminfo)
  set viminfo^=!
endif

if !&scrolloff
  set scrolloff=1
endif
if !&sidescrolloff
  set sidescrolloff=5
endif
set display+=lastline

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
    au!

    " For all text files set 'textwidth' to 78 characters.
    autocmd FileType text setlocal textwidth=78

    " When editing a file, always jump to the last known cursor position.
    " Don't do it when the position is invalid or when inside an event handler
    " (happens when dropping a file on gvim).
    " Also don't do it when the mark is in the first line, that is the default
    " position when opening a file.
    autocmd BufReadPost *
          \ if line("'\"") > 1 && line("'\"") <= line("$") |
          \	exe "normal! g`\"" |
          \ endif

  augroup END
else
endif " has("autocmd")

" Buffer prev/next
nnoremap <C-x> :bnext<CR>
nnoremap <C-z> :bprev<CR>

" Better split switching
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Fast saving
nmap <leader>w :w!<cr>

" Center the screen
nnoremap <space> zz

" Move up and down on splitted lines (on small width screens)
map <Up> gk
map <Down> gj
map k gk
map j gj

" Just go out in insert mode
imap jk <ESC>l

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Do not show stupid q: window
map q: :q
command WQ wq
command Wq wq
command Wqa wqa
command W w
command Q q

" Allow saving of files as sudo when I forgot to start vim using sudo.
cmap w!! w !sudo tee > /dev/null %

" never do this again --> :set paste <ctrl-v> :set no paste
let &t_SI .= "\<Esc>[?2004h"
let &t_EI .= "\<Esc>[?2004l"

inoremap <special> <expr> <Esc>[200~ XTermPasteBegin()

function! XTermPasteBegin()
  set pastetoggle=<Esc>[201~
  set paste
  return ""
endfunction

" set 80 character line limit
if exists('+colorcolumn')
  set colorcolumn=80
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif

"" Python specific
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
      \ [%l/%L\ (%p%%)
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly
autocmd BufRead *.py nmap <F5> :!python %<CR>

"" Ruby specific
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2

"" Ruby specific
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2
let g:vimrubocop_rubocop_cmd = 'bundle exec rubocop --require rubocop-rspec --except RSpec/VerifiedDoubles '

"" Omnicomplete
filetype plugin on
"let g:SuperTabDefaultCompletionType = "<C-X><C-O>"
autocmd FileType ruby set omnifunc=rubycomplete#Complete
autocmd FileType ruby let g:rubycomplete_buffer_loading=1
autocmd FileType ruby let g:rubycomplete_classes_in_global=1
"autocmd Filetype java setlocal omnifunc=javacomplete#Complete
"autocmd Filetype java setlocal completefunc=javacomplete#CompleteParamsInfo

" Supertab settings
" supertab + eclim == java win
let g:SuperTabDefaultCompletionTypeDiscovery = [
\ "&completefunc:<c-x><c-u>",
\ "&omnifunc:<c-x><c-o>",
\ ]
let g:SuperTabLongestHighlight = 1

"" shortcuts 
nmap <leader>e :NERDTreeToggle<CR>
nmap <leader>r :NERDTreeFind<cr>

let NERDTreeShowHidden=1

let NERDTreeIgnore=['\.vim$', '\~$', '\.git$', '.DS_Store']

" Close nerdtree and vim on close file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

let g:tagbar_ctags_bin='ctags'  " Proper Ctags locations
noremap <silent> <Leader>y :TagbarToggle<cr>
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>a :Ag 
nnoremap <leader>s :Ag<cr>
nnoremap <C-P> :CommandT<cr>

let g:CommandTFileScanner = "git"
let g:CommandTMaxHeight = 30
let g:CommandTMaxFiles = 500000
let g:CommandTSCMDirectories='.git,.hg,.svn,.bzr,_darcs,manifest.webapp'

" Persistent undo
if has('persistent_undo')
    set undofile
endif
set undodir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set undolevels=5000

" Remap the undo key to warn about stepping back into a buffer's pre-history...
nnoremap <expr> u VerifyUndo()
" Track each buffer's starting position in undo history...
augroup UndoWarnings 
    autocmd!
    autocmd BufReadPost,BufNewFile *
                \ :call Rememberundo_start()
augroup END

function! Rememberundo_start ()
    let b:undo_start = exists('b:undo_start')
                \ ? b:undo_start
                \ : undotree().seq_cur
endfunction

function! VerifyUndo ()
    " Are we back at the start of this session
    " (but still with undos possible)???
    let undo_now = undotree().seq_cur
    if undo_now > 0 && undo_now == b:undo_start
        " If so, ask whether to undo into pre-history...
        return confirm('',
                    \ "Undo into previous session? (&Yes\n&No)",1) == 1
                    \ ? "\<C-L>u" : "\<C-L>"
    endif
    " Otherwise, just undo...
    return 'u'
endfunction

"let g:auto_save = 1

au! BufNewFile,BufReadPost *.{yaml,yml} set filetype=yaml
autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab
