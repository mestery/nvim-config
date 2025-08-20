return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
    },
    config = function()
      local lspconfig = require("lspconfig")
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")

      mason.setup()
      mason_lspconfig.setup()

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      local servers = { "pyright", "gopls", "lua_ls", "rust_analyzer", "clangd", "ccls" }

      for _, server in ipairs(servers) do
        lspconfig[server].setup({
          capabilities = capabilities,
        })
      end

      -- Setup formatting on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.go",
        callback = function()
          vim.lsp.buf.format({ async = true })
        end,
      })

      -- Format Rust files on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.rs",
        callback = function()
          vim.lsp.buf.format({ async = true })
        end,
      })

      -- Format C/C++ files on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.{c,cpp,h,hpp}",
        callback = function()
          vim.lsp.buf.format({ async = true })
        end,
      })

      -- Format Python files on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.py",
        callback = function()
          vim.lsp.buf.format({ async = true })
        end,
      })
    end,
  }
}
