require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "clojure_lsp", "typescript_language_server" }
vim.lsp.enable(servers)

vim.lsp.config("gopls", {
  settings = {
    completeUnimported = true,
    usePlaceholders = true,
  },
})

vim.lsp.config("typescript_language_server", {
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  cmd = { "typescript-language-server", "--stdio" }, -- Command to start the server
  settings = {
    -- Optional: Configure the server to find the nearest project root (package.json or tsconfig.json)
    -- This helps with monorepos and mixed JS/TS projects
    -- You may need to use an adapter like tsgo for optimal monorepo support
    -- Example setting:
    -- tsserver = {
    --     root_dir = lspconfig.util.root_finder({ "tsconfig.json", "package.json" }, { upward = true })(),
    -- }
  },
})

-- read :h vim.lsp.config for changing options of lsp servers
