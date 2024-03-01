local config=function()

  local lspconfig = require("lspconfig") 
  local cmp_nvim_lsp = require("cmp_nvim_lsp")
  local capabilities = cmp_nvim_lsp.default_capabilities()

  --diagnostic icons
  local diagnostic_signs= {
    Error = " ",
    Warn = " ",
    Hint = "",
    Info = "",
  }

  for type, icon in pairs(diagnostic_signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  end

  lspconfig.tsserver.setup({
    capabilities = capabilities,
    
  })
  lspconfig.clangd.setup({
    capabilities = capabilities,
    
  })




  lspconfig.rust_analyzer.setup({
    capabilities = capabilities,
    settings={
      ["rust-analyzer"] = {
        imports = {
          granularity = {
            group = "module",
          },
          prefix = "self",
        },
        cargo = {
          buildScripts = {
            enable = true,
          },
        },
        procMacro = {
          enable = true
        },
        checkOnSave={
          command = "clippy",
        },
      }
    }
  })

  lspconfig.lua_ls.setup({
    capabilities = capabilities,
    settings = { 
      Lua = {
        -- make the language server recognize "vim" global
        diagnostics = {
          globals = { "vim" },
        },
        workspace = {
          -- make language server aware of runtime files
          library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,
          },
        },
      },
    },
  })




end


return {
  "neovim/nvim-lspconfig",
  config = config,
  lazy = false,
  dependencies = {
    "williamboman/mason.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-nvim-lsp",
  },
}
