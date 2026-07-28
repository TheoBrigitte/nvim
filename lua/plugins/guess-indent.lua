return {
  {
    -- Detect tabs vs spaces from the buffer content, for repos without .editorconfig
    "NMAC427/guess-indent.nvim",
    event = "BufReadPre",
    opts = {},
  },
}
