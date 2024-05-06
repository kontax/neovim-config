-- Base vim settings

local opt = vim.opt

-- System

opt.showcmd = true                      -- Display incomplete commands
opt.showmode = true                     -- Display the mode you're in
opt.cursorline = true                   -- Highlights the line the cursor is on

opt.directory = os.getenv("HOME") .. "/.vim/tmp"        -- Keep swap files in one location

opt.wildmenu = true                     -- Enhance command line completion
opt.wildmode = "list:longest"           -- Complete files like a shell

opt.binary = true                       -- Write files as they are without changing line endings
opt.hidden = true                       -- Handle multiple buffers better


-- File browsing

--vim.g.netrw_liststyle = "3"                 -- Use a tree view in netrw


-- Input

opt.backspace = "indent,eol,start"      -- Intuitive backspacing
opt.mouse = "a"                         -- Enable mouse scrolling


-- Search options

opt.ignorecase = true                    -- Case-insensitive searching
opt.smartcase = true                     -- But case-sensitive if the expression contains a capital letter
opt.incsearch = true                     -- Highlight matches as you type
opt.hlsearch = true                      -- Highlight matches


-- Tabs

opt.tabstop = 4                         -- Global tab width
opt.softtabstop = 4                     -- Tab in insert mode
opt.shiftwidth = 4                      -- And again, related
opt.expandtab = true                    -- Use spaces instead of tabs
opt.smartindent = true


-- Visual

opt.number = true                       -- Show line numbers
opt.ruler = true                        -- Show cursor position

opt.colorcolumn = "80"                  -- Horizontal line at specified column

opt.wrap = true                         -- Turn on line wrapping
opt.scrolloff = 3                       -- Show 3 lines of context around the cursor

opt.list = true                         -- Enable invisible characters

opt.visualbell = true                   -- Flash screen on errors
opt.cmdheight = 2                       -- Extra space for messages
opt.signcolumn = "yes"                  -- Always show the signcolumn
opt.updatetime = 300                    -- Reduce time for diagnostic messages
opt.shortmess:append { c = true }       -- Don't show ins-completion-menu messages


-- Split Windows

opt.splitbelow = true                   -- Split horizontally to the bottom
opt.splitright = true                   -- Split vertically to the right


-- Folding
opt.foldenable = true                   -- Enable folding
opt.foldlevelstart = 10                 -- Open most folds up to 10 deep
opt.foldnestmax = 10                    -- 10 nested folds max
opt.foldmethod = "syntax"               -- Folds based on syntax level

-- Undo
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
