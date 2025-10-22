return {
  {
    "williamboman/mason.nvim", 
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {
          "lua_ls",
          "html", "cssls", "tailwindcss", "ts_ls", -- Html, CSS, Tailwind, JavaScript, TypeScript
          "pyright", -- Python
          "clangd", -- C/C++
          "rust_analyzer", -- Rust
          "jsonls", -- JSON
        },
        opts = {
          automatic_enable = {
            exclude = {
              "jdtls", -- Java
            }
          }
        }
      })
    end
  },
  {
    "mfussenegger/nvim-jdtls",
    config = function()
        vim.api.nvim_create_autocmd("FileType", {
          pattern = "java",
          callback = function(args)
            require"plugins.jdtls.setup".setup()
          end,
        })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.lsp.config("lua_ls", {})
      vim.lsp.config("ts_ls", {})
      vim.lsp.config("jdtls", {})
      vim.lsp.config("pyright", {})
      vim.lsp.config("clangd", {})
      vim.lsp.config("rust_analyzer", {})
      vim.lsp.config("jsonls", {})
      vim.lsp.config("html", {})
      vim.lsp.config("cssls", {})
      vim.lsp.config("tailwindcss", {})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Show diagnostic under cursor" })
    end
  }
}
