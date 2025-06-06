-- ~/.config/nvim/lua/core/options.lua

local opt = vim.opt -- for conciseness

-- => General
opt.history = 1000 -- Sets how many lines of history VIM has to remember
opt.autoread = true -- Set to auto read when a file is changed from the outside
opt.undofile = true -- Persistent undo
opt.undodir = vim.fn.stdpath("data") .. "/undodir"
opt.undolevels = 5000

-- => VIM user interface
opt.so = 7 -- Set 7 lines to the cursor - when moving vertically using j/k
opt.wildmenu = true -- Turn on the Wild menu
opt.ruler = true -- Always show current position
opt.cmdheight = 2 -- Height of the command bar
opt.hidden = true -- A buffer becomes hidden when it is abandoned
opt.showmatch = true -- Show matching brackets when text indicator is over them
opt.mat = 2 -- How many tenths of a second to blink when matching brackets
-- opt.lazyredraw = true -- Don't redraw while executing macros (good performance config)
opt.foldcolumn = "1" -- Add a bit extra margin to the left
opt.foldenable = false

-- Use numbers for jeffkreeftmeijer/vim-numbertoggle
opt.number = true
opt.relativenumber = true

-- Search settings
opt.ignorecase = true -- Ignore case when searching
opt.smartcase = true -- When searching try to be smart about cases
opt.hlsearch = true -- Highlight search results
opt.incsearch = true -- Makes search act like search in modern browsers

-- No annoying sound on errors
opt.errorbells = false
opt.visualbell = false
--vim.api.nvim_set_option_value("t_vb", "", {})

-- Configure backspace so it acts as it should act
opt.backspace = "eol,start,indent"
opt.whichwrap:append("<,>,h,l")

-- => Colors and Fonts
vim.cmd("syntax enable")
opt.termguicolors = true -- Enable 256 colors palette
opt.background = "dark"
vim.cmd("colorscheme slate")
opt.encoding = "utf8" -- Set utf8 as standard encoding
opt.ffs = "unix,dos,mac" -- Use Unix as the standard file type

-- => Files, backups and undo
opt.backup = false
opt.writebackup = false
opt.swapfile = false

-- => Text, tab and indent related
opt.expandtab = true -- Use spaces instead of tabs
opt.smarttab = true -- Be smart when using tabs ;)
opt.shiftwidth = 4 -- 1 tab == 4 spaces
opt.tabstop = 4
opt.linebreak = true -- Linebreak on 500 characters
opt.tw = 500
opt.autoindent = true -- Auto indent
opt.smartindent = true -- Smart indent
opt.wrap = true -- Wrap lines

-- => Status line
opt.laststatus = 2 -- Always show the status line
opt.statusline = "%{HasPaste()}%F%m%r%h %w  CWD: %r%{getcwd()}%h   Line: %l  Column: %c"

-- => Other
opt.updatetime = 100 -- Set update time to something sane
opt.completeopt = "menu,menuone,preview,noselect,noinsert"

-- Ignore compiled files
opt.wildignore:append("*.o,*.pyc,*~")
opt.wildignore:append("*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store")
