return {
  {
    "tinted-theming/tinted-vim",
    config = function()
      vim.opt.termguicolors = true
      vim.cmd.colorscheme("base16-tomorrow-night")
    end,
  }
}
