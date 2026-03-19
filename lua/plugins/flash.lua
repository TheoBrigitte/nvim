return {
  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = function(plugin, opts)
      -- Fixing the highlight groups colors for flash.nvim
      vim.api.nvim_set_hl(0, "FlashMatchFix", { fg = "#ff966c", bg = "#1b1d2b" })
      vim.api.nvim_set_hl(0, "FlashCurrentFix", { fg = "#ff966c", bg = "#1b1d2b", bold = true })
      vim.api.nvim_set_hl(0, "FlashLabelFix", { fg = "#1b1d2b", bg = "#ff966c" })

      return {
        highlight = {
          -- show a backdrop with hl FlashBackdrop
          backdrop = true,
          -- Highlight the search matches
          matches = true,
          -- extmark priority
          priority = 5000,
          groups = {
            match = "FlashMatchFix",
            current = "FlashCurrentFix",
            backdrop = "FlashBackdrop",
            label = "FlashLabelFix",
          },
        },
        modes = {
          char = {
            search = { wrap = true },
            highlight = {
              -- show a backdrop with hl FlashBackdrop
              backdrop = true,
              -- Highlight the search matches
              matches = true,
              -- extmark priority
              priority = 5000,
              groups = {
                match = "FlashMatchFix",
                current = "FlashCurrent",
                backdrop = "FlashBackdrop",
                label = "FlashMatchFix",
              },
            }
          }
        }
      }
    end,
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
      --{ "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
      --{ "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
      --{ "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
      --{ "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
    },
  },
}
