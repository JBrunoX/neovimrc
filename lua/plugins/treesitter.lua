return {
  {
    'nvim-treesitter/nvim-treesitter',
    build = { ":TSUpdate" },
    lazy = false,
    config = function()
      local configs = require("nvim-treesitter.configs")
      configs.setup({
        highlight = { enable = true },
        indent = { enable = true },
        ensure_installed = {
          "lua", "html", "css", "javascript", "typescript", "tsx",
          "python", "java", "cpp", "rust", "go", "yaml", "bash",
          "dockerfile", "markdown", "http",
        },
        additional_vim_regex_highlighting = false,
      })
    end
  },
}

