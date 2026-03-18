vim.cmd [[
set number " Enable line numbers
set relativenumber " Enable relative line numbers

set ruler " Show the cursor position
set incsearch "
set ignorecase " Case insensitive searching
set smartcase " Smart case searching

set expandtab
set tabstop=2
set shiftwidth=2
set autoindent
set smartindent
filetype plugin indent on
"autocmd FileType yaml setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab cursorcolumn "foldmethod=indent
"autocmd Syntax yaml normal zR

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
]]
