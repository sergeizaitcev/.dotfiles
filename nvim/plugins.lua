local plugins = {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "lua",
        "go",
        "gomod",
        "gosum",
        "gowork",
        "python",
        "yaml",
        "html",
        "css",
        "javascript",
        "json",
        "markdown",
        "sql",
      },
    },
  },

  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "golangci-lint-langserver",
        "lua-language-server",
        "gopls",
        "pyright",
      },
    },
  },

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("plugins.configs.lspconfig")
      require("custom.configs.lspconfig")
    end,
  },

  {
    "jose-elias-alvarez/null-ls.nvim",
    ft = "go",
    opts = function()
      return require("custom.configs.null-ls")
    end,
  },

  {
    "mfussenegger/nvim-dap",
    ft = "go",
  },

  {
    "rcarriga/nvim-dap-ui",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      require("custom.configs.dap-ui")
    end,
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    dependencies = {
      "mfussenegger/nvim-dap",
      "rcarriga/nvim-dap-ui",
    },
    config = function(_, opts)
      require("dap-go").setup(opts)
      require("core.utils").load_mappings("debug")
    end,
  },

  {
    "nvim-neotest/neotest-go",
    ft = "go",
  },

  {
    "andythigpen/nvim-coverage",
    ft = "go",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("custom.configs.coverage")
    end,
  },

  {
    "nvim-neotest/neotest",
    ft = "go",
    dependencies = {
      "nvim-neotest/neotest-go",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    config = function()
      require("custom.configs.neotest")
      require("core.utils").load_mappings("testing")
    end,
  },

  {
    "toppair/peek.nvim",
    ft = "markdown",
    build = "deno task --quiet build:fast",
    config = function()
      require("custom.configs.peek")
      require("core.utils").load_mappings("markdown")
    end,
  },
}

return plugins
