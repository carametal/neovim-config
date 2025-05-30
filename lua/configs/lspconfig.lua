-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

-- EXAMPLE
local servers = {
  "html",
  "cssls",
  "gopls",
  "volar",
  "jsonls",
}

local nvlsp = require "nvchad.configs.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
lspconfig.ts_ls.setup {
  on_attach = nvlsp.on_attach,
  capabilities = nvlsp.capabilities,
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vim.fn.stdpath "data" .. "/mason/packages/vue-language-server/node_modules/@vue/language-server",
        languages = { "javascript", "typescript", "vue" },
      },
    },
  },
  filetypes = {
    "typescript",
    "javascript",
    "vue",
  },
}

lspconfig.lua_ls.setup {
  settings = {
    Lua = {
      workspace = {
        -- EmmyLua Spoonの型定義ファイルを追加
        library = {
          vim.fn.expand "~/.hammerspoon/Spoons/EmmyLua.spoon/annotations",
        },
      },
    },
  },
}
