vim.opt.number = true -- Line numbers
vim.opt.relativenumber = true -- Relative line numbers
vim.opt.cursorline = false -- Highlight current line
vim.opt.wrap = false -- Don't wrap lines
vim.opt.scrolloff = 10 -- Keep 10 lines above/below cursor

-- Indentation
vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.breakindent = true -- stops line wrapping from being confusing

-- Search settings
vim.opt.ignorecase = true -- Case insensitive search unless \C or 1 <= #capital-laters
vim.opt.smartcase = true -- Case sensitive if uppercase in search
vim.opt.hlsearch = true -- Highlight search
vim.opt.incsearch = true -- Show matches as you type

-- Visual settings
vim.opt.termguicolors = true -- Enable 24-bit colors
vim.opt.signcolumn = 'yes' -- Always show sign column
vim.opt.showmatch = true -- Highlight matching brackets
vim.opt.matchtime = 2 -- How long to show matching bracket
vim.opt.completeopt = 'menuone,noinsert,noselect' -- Completion options
vim.opt.showmode = false -- Don't show mode in command line
vim.opt.pumheight = 10 -- Popup menu height
vim.opt.pumblend = 10 -- Popup menu transparency
vim.opt.lazyredraw = true -- Don't redraw during macros

-- File handling
vim.opt.swapfile = false -- Don't create swap files
vim.opt.undofile = true -- Persistent undo
vim.opt.undodir = vim.fn.expand('~/.vim/undodir') -- Undo directory
vim.opt.updatetime = 250 -- Faster completion
vim.opt.timeoutlen = 300 -- Key timeout duration

-- Behavior settings
vim.opt.backspace = 'indent,eol,start' -- Better backspace behavior
vim.opt.mouse = 'a' -- Enable mouse support

-- Cursor settings
vim.opt.guicursor = ''

-- Split behavior
vim.opt.splitbelow = true -- Horizontal splits go below
vim.opt.splitright = true -- Vertical splits go right

-- Sets how neovim will display certain whitespace characters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'
