return {
  "nvim-treesitter/nvim-treesitter-textobjects",
  branch = "main",
  event = { "BufReadPost", "BufNewFile" },
  dependencies = { "nvim-treesitter/nvim-treesitter" },
  config = function()
    require("nvim-treesitter-textobjects").setup({
      move = {
        set_jumps = true, -- whether to set jumps in the jumplist
      },
    })

    local move = require("nvim-treesitter-textobjects.move")

    -- { lhs, move function, query, query group, description }
    -- The query group is the `queries/<lang>/<group>.scm` file to read from.
    local maps = {
      { "]f", "goto_next_start",     "@call.outer",        "textobjects", "Next function call start" },
      { "]]", "goto_next_start",     "@function.outer",    "textobjects", "Next method/function def start" },
      { "]c", "goto_next_start",     "@class.outer",       "textobjects", "Next class start" },
      { "]i", "goto_next_start",     "@conditional.outer", "textobjects", "Next conditional start" },
      { "]l", "goto_next_start",     "@loop.outer",        "textobjects", "Next loop start" },
      { "]s", "goto_next_start",     "@scope",             "locals",      "Next scope" },
      { "]z", "goto_next_start",     "@fold",              "folds",       "Next fold" },

      { "]F", "goto_next_end",       "@call.outer",        "textobjects", "Next function call end" },
      { "]M", "goto_next_end",       "@function.outer",    "textobjects", "Next method/function def end" },
      { "]C", "goto_next_end",       "@class.outer",       "textobjects", "Next class end" },
      { "]I", "goto_next_end",       "@conditional.outer", "textobjects", "Next conditional end" },
      { "]L", "goto_next_end",       "@loop.outer",        "textobjects", "Next loop end" },

      { "[f", "goto_previous_start", "@call.outer",        "textobjects", "Prev function call start" },
      { "[[", "goto_previous_start", "@function.outer",    "textobjects", "Prev method/function def start" },
      { "[c", "goto_previous_start", "@class.outer",       "textobjects", "Prev class start" },
      { "[i", "goto_previous_start", "@conditional.outer", "textobjects", "Prev conditional start" },
      { "[l", "goto_previous_start", "@loop.outer",        "textobjects", "Prev loop start" },

      { "[F", "goto_previous_end",   "@call.outer",        "textobjects", "Prev function call end" },
      { "[M", "goto_previous_end",   "@function.outer",    "textobjects", "Prev method/function def end" },
      { "[C", "goto_previous_end",   "@class.outer",       "textobjects", "Prev class end" },
      { "[I", "goto_previous_end",   "@conditional.outer", "textobjects", "Prev conditional end" },
      { "[L", "goto_previous_end",   "@loop.outer",        "textobjects", "Prev loop end" },
    }

    for _, m in ipairs(maps) do
      local lhs, fn, query, group, desc = m[1], m[2], m[3], m[4], m[5]
      vim.keymap.set({ "n", "x", "o" }, lhs, function()
        move[fn](query, group)
      end, { desc = desc })
    end
  end,
}
