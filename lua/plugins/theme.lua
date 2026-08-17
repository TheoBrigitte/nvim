return {
  {
    "rebelot/kanagawa.nvim",
    lazy = false,
    priority = 1000, -- load before any other plugin so highlights are in place
    config = function()
      vim.opt.termguicolors = true
      require("kanagawa").setup({
        theme = "wave",
        background = { dark = "wave", light = "lotus" },
        compile = true,
      })
      vim.cmd.colorscheme("kanagawa-wave")
    end,
  }
}
