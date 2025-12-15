vim.cmd [[
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


vim.g.some_global_variable = {
  -- Make sure to setup `mapleader` and `maplocalleader` before
  -- loading lazy.nvim so that mappings are correct.
  -- This is also a good place to setup other settings (vim.opt)
  mapleader = "\\",
  maplocalleader = "\\",
}
