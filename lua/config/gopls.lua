-- Golang LSP setup using nvim-lspconfig
-- Auto-completion
-- Use CTRL-Y to select an item. |complete_CTRL-Y|

-- Helper function to get module name from go.mod
local function get_go_module()
  local gomod = vim.fn.findfile("go.mod", ".;")
  if gomod == "" then
    return nil
  end
  local content = vim.fn.readfile(gomod)
  for _, line in ipairs(content) do
    local module = line:match("^module%s+(.+)")
    if module then
      return module
    end
  end
  return nil
end

vim.lsp.config('gopls', {
  settings = {
    gopls = {
      analyses = {
        unusedparams = true,
      },
      staticcheck = true,
      gofumpt = true,
      -- Dynamically set local module prefix from go.mod
      ["local"] = get_go_module() or "",
    },
  },
  on_attach = function(client, bufnr)
    -- Enable format on save for Go files
    if client.server_capabilities.documentFormattingProvider then
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = {only = {"source.organizeImports"}}
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({async = false})
  end
})
vim.lsp.enable('gopls')
