-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

vim.cmd [[
set number " Enable line numbers
set ruler " Show the cursor position
set incsearch "
set ignorecase " Case insensitive searching
set smartcase " Smart case searching
set listchars=tab:›-,trail:⋅,eol:$ " Set list characters
set signcolumn=yes " Always show the sign column
set splitright " Vertical splits will automatically be to the right
set splitbelow " Horizontal splits will automatically be below
" Highlight search results only while searching
augroup vimrc-incsearch-highlight
  autocmd!
  autocmd CmdlineEnter /,\? :set hlsearch
  autocmd CmdlineLeave /,\? :set nohlsearch
augroup END


"""" Copy / Paste
"toggle paste mode
"set pastetoggle=\\p
" Replace current word with contents of clipboard
map <leader>o cw<C-r>0<ESC>
" Yank to system clipboard
map Y "+y
" Paste from system clipboard
map <leader>p "+p
map <leader>P "+P

nnoremap <leader>w <cmd>w<CR>
nnoremap <leader>Q <cmd>quitall!<CR>

"""" Git
nnoremap <leader>gf /^<<<<<<<CR>0zt
nnoremap <leader>go dd/^=======<CR>d/^>>>>>>><CR>dd
nnoremap <leader>gt d/^=======<CR>dd/^>>>>>>><CR>dd

"""" Misc
" Reload vim config
map <leader>e <cmd>so ~/.vim/vimrc<CR>
" Because we all make typos
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qa qa
cnoreabbrev Qall qall
cnoreabbrev Qall! qall!
" open/close quickfix window
"map <leader>o :copen<CR>
"map <leader>p :cclose<CR>
nnoremap <leader>z <cmd>suspend!<CR>

"""" ShellCheck
" Lint current file with ShellCheck
map <leader>s  <cmd>ShellCheck!<CR>

" Resize splits
map <C-Down> <cmd>resize -2<CR>
map <C-Up> <cmd>resize +2<CR>
map <C-Left> <cmd>vertical resize -2<CR>
map <C-Right> <cmd>vertical resize +2<CR>

" Color scheme toggle (light/dark)
map <leader>C  <cmd>call Switch_background()<CR>
function! Switch_background()
    if g:colors_name == "base16-tomorrow-night"
        colorscheme base16-tomorrow
    else
        colorscheme base16-tomorrow-night
    endif
endfunction
]]

-- Golang LSP setup using nvim-lspconfig
vim.lsp.enable('gopls')
-- Auto-completion
-- Use CTRL-Y to select an item. |complete_CTRL-Y|
vim.lsp.config('gopls', {
  on_attach = function(client, bufnr)
    vim.lsp.completion.enable(true, client.id, bufnr, {
      autotrigger = true,
      convert = function(item)
        return { abbr = item.label:gsub('%b()', '') }
      end,
    })
  end,
})


-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

-- Persistent undo.
vim.opt.undofile = true
vim.opt.undodir = vim.fs.normalize("~/.local/state/nvim/undo//")

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- import your plugins
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  -- colorscheme that will be used when installing plugins.
  install = { colorscheme = { "base16-tomorrow-night" } },
  -- automatically check for plugin updates
  checker = { enabled = true, notify = false },
})
