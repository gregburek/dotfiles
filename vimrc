filetype off
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
"" call pathogen#infect()
"" many settings from http://items.sjbach.com/319/configuring-vim-right

set nocompatible                " choose no compatibility with legacy vi
syntax enable
set encoding=utf-8

filetype off
filetype plugin indent off
set runtimepath+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

set showcmd                     " display incomplete commands
filetype plugin indent on       " load file type plugins + indentation
set nu                          " line numbers
set ruler
let mapleader = ","
set hidden                      " allow Vim to manage multiple buffers effectively
set history=1000                " Keep a longer history
set wildmenu                    " Make file/command completion useful
set wildmode=list:longest       " complete only up to the point of ambiguity
set title
set shortmess=atI               " Stifle many interruptive prompts
set visualbell
set colorcolumn=80

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

"" Python specific 
set list listchars=tab:▷⋅,trail:⋅,nbsp:⋅
set statusline=%F%m%r%h%w\ [TYPE=%Y\ %{&ff}]\
      \ [%l/%L\ (%p%%)
au FileType py set autoindent
au FileType py set smartindent
au FileType py set textwidth=79 " PEP-8 Friendly
autocmd BufRead *.py nmap <F5> :!python %<CR>

"" Ruby specific
autocmd Filetype ruby setlocal ts=2 sts=2 sw=2

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
let g:tagbar_ctags_bin='ctags'  " Proper Ctags locations
noremap <silent> <Leader>y :TagbarToggle<cr>
let g:ackprg = 'ag --nogroup --nocolor --column'
nnoremap <leader>a :Ack 
nnoremap <leader>s :Ack<cr>


"------------------------------------------------------------
" CtrlP
"------------------------------------------------------------
" Set the max files
let g:ctrlp_max_files = 10000

" Optimize file searching
if has("unix")
    let g:ctrlp_user_command = {
                \   'types': {
                \       1: ['.git/', 'cd %s && git ls-files']
                \   },
                \   'fallback': 'find %s -type f | head -' . g:ctrlp_max_files
                \ }
endif

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

