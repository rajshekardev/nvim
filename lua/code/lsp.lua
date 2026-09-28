vim.pack.add({
  "https://github.com/neovim/nvim-lspconfig",
  "https://github.com/mason-org/mason.nvim",
})

require("mason").setup()


local ensure_installed = {
  -- LSP
  "tsc",
  "gopls",
  "ols",
  "lua-language-server",
  "svelte-language-server",
  "astro-language-server",
  "vue-language-server",

  -- Formatters
  "stylua",
  "biome",
  "prettier",

  -- Linters
  "oxlint",
  "eslint-lsp",
}

local registry = require("mason-registry")

registry.refresh(function()
  for _, name in ipairs(ensure_installed) do
    if registry.has_package(name) then
      local package = registry.get_package(name)

      if not package:is_installed() and not package:is_installing() then
        package:install()
      end
    else
      vim.notify(
        ("Mason package not found: %s"):format(name),
        vim.log.levels.WARN
      )
    end
  end
end)

local capabilities = vim.lsp.protocol.make_client_capabilities()

capabilities = vim.tbl_deep_extend(
  "force",
  capabilities,
  require("mini.completion").get_lsp_capabilities()
)

vim.lsp.config("*", {
  capabilities = capabilities,
})

vim.lsp.config("lua_ls", {
  settings = {
    Lua = {
      diagnostics = { global = { "vim" } }
    }
  }
})

vim.lsp.enable({
  "tsc",
  "gopls",
  "ols",
  "lua_ls",
  "svelte",
  "astro",
  "vue_ls",
})
