-- Base vim settings

-- System

vim.opt.showcmd = true                      -- Display incomplete commands
vim.opt.showmode = true                     -- Display the mode you're in
vim.opt.cursorline = true                   -- Highlights the line the cursor is on

vim.opt.directory = os.getenv("HOME") .. "/.vim/tmp"        -- Keep swap files in one location

vim.opt.wildmenu = true                     -- Enhance command line completion
vim.opt.wildmode = "list:longest"           -- Complete files like a shell

vim.opt.binary = true                       -- Write files as they are without changing line endings
vim.opt.hidden = true                       -- Handle multiple buffers better


-- Input

vim.opt.backspace = "indent,eol,start"      -- Intuitive backspacing
vim.opt.mouse = "a"                         -- Enable mouse scrolling


-- Search options

vim.opt.ignorecase = true                    -- Case-insensitive searching
vim.opt.smartcase = true                     -- But case-sensitive if the expression contains a capital letter

vim.opt.incsearch = true                     -- Highlight matches as you type
vim.opt.hlsearch = true                      -- Highlight matches


-- Tabs

vim.opt.tabstop = 4                         -- Global tab width
vim.opt.softtabstop = 4                     -- Tab in insert mode
vim.opt.shiftwidth = 4                      -- And again, related
vim.opt.expandtab = true                    -- Use spaces instead of tabs
vim.opt.smartindent = true


-- Visual

vim.opt.number = true                       -- Show line numbers
vim.opt.ruler = true                        -- Show cursor position

vim.opt.colorcolumn = "80"                  -- Horizontal line at specified column

vim.opt.wrap = true                         -- Turn on line wrapping
vim.opt.scrolloff = 3                       -- Show 3 lines of context around the cursor

vim.opt.list = true                         -- Enable invisible characters

vim.opt.visualbell = true                   -- Flash screen on errors
vim.opt.cmdheight = 2                       -- Extra space for messages
vim.opt.signcolumn = "yes"                  -- Always show the signcolumn
vim.opt.updatetime = 300                    -- Reduce time for diagnostic messages
vim.opt.shortmess:append { c = true }       -- Don't show ins-completion-menu messages


-- Split Windows

vim.opt.splitbelow = true                   -- Split horizontally to the bottom
vim.opt.splitright = true                   -- Split vertically to the right


-- Folding
vim.opt.foldenable = true                   -- Enable folding
vim.opt.foldlevelstart = 10                 -- Open most folds up to 10 deep
vim.opt.foldnestmax = 10                    -- 10 nested folds max
vim.opt.foldmethod = "syntax"               -- Folds based on syntax level

-- Undo
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
