-- File change history / persistent undo
vim.opt.undofile = true
vim.opt.undodir = vim.fs.normalize("~/.local/state/nvim/undo//")

-- Navigation
vim.opt.number = true -- Enable line numbers
vim.opt.relativenumber = true -- Enable relative line numbers
vim.opt.ruler = true -- Show the cursor position
vim.opt.scrolloff = 4 -- Keep n lines visible when scrolling
vim.opt.signcolumn = "yes" -- Always show the sign column to prevent text shifting
vim.opt.splitright = true -- Open vertical splits to the right of the current window
vim.opt.splitbelow = true -- Open horizontal splits below the current window

-- Search
vim.opt.incsearch = true
vim.opt.ignorecase = true -- Case insensitive searching
vim.opt.smartcase = true -- Smart case searching

-- Indentation
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 2 -- Number of spaces that a <Tab> in the file counts for
vim.opt.shiftwidth = 2 -- Number of spaces to use for each step of (auto)indent
vim.opt.autoindent = true -- Copy indent from current line when starting a new line
vim.opt.smartindent = true -- Smart autoindenting when starting a new line

-- Misc
vim.opt.swapfile = false -- Disable swap files
vim.opt.listchars = { tab = "›-", trail = "⋅", eol = "$" } -- Set list characters

-- Highlight search results only while searching
local incsearch_group = vim.api.nvim_create_augroup("vimrc-incsearch-highlight", { clear = true })
vim.api.nvim_create_autocmd("CmdlineEnter", {
  group = incsearch_group,
  pattern = { "/", "\\?" },
  callback = function() vim.opt.hlsearch = true end,
})
vim.api.nvim_create_autocmd("CmdlineLeave", {
  group = incsearch_group,
  pattern = { "/", "\\?" },
  callback = function() vim.opt.hlsearch = false end,
})
