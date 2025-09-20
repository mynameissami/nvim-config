return {
  -- Formatter: Conform.nvim
  {
    "stevearc/conform.nvim",
    lazy = false,
    config = function()
      local opts = require("configs.conform")
      require("conform").setup(opts)
    end,
  },

  { "MaxMEllon/vim-jsx-pretty", lazy = false },
  { "jose-elias-alvarez/null-ls.nvim", lazy = false },
  { "rafamadriz/friendly-snippets", lazy = false },

  -- Mason for managing LSPs, formatters, linters
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        -- LSPs
        "clangd",
        "pyright",
        "rust-analyzer",
        "html-lsp",
        "css-lsp",
        "typescript-language-server",
        "tailwindcss-language-server",
        "eslint-lsp",
        "jdtls",

        -- Formatters / Tools
        "prettier",
        "clang-format",
        "rustfmt",
        "black",
        "stylua",
        "emmet-ls",
        "google-java-format", 
      },
    },
  },

  -- LSP Config
  {
    "neovim/nvim-lspconfig",
    lazy = false,
    config = function()
      local lspconfig = require("lspconfig")
      local on_attach = require("nvchad.configs.lspconfig").on_attach
      local capabilities = require("nvchad.configs.lspconfig").capabilities

      -- Default servers (from your configs/lspconfig.lua)
      require("configs.lspconfig")

      lspconfig.jdtls.setup {
        on_attach = on_attach,
        capabilities = capabilities,
        cmd = { "jdtls" }, -- Mason installs this
        root_dir = lspconfig.util.root_pattern(
          ".git", "mvnw", "gradlew", "pom.xml", "build.gradle"
        ),
      }
    end,
  },

  -- NvimTree File Explorer
  {
    "nvim-tree/nvim-tree.lua",
    opts = require("configs.nvimtree"),
  },

  -- Spectre for Search/Replace
  {
    "nvim-pack/nvim-spectre",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
  },

  -- Telescope Fuzzy Finder
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
  },

  -- Which-key UI
  {
    "folke/which-key.nvim",
    lazy = false,
  },

  -- Treesitter Syntax Highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
      ensure_installed = {
        "lua", "vim", "query",
        "python",
        "c", "cpp",
        "rust",
        "html", "css", "scss",
        "javascript", "typescript", "tsx",
        "json", "yaml", "toml",
        "markdown", "markdown_inline",
        "bash", "dockerfile", "make", "cmake", "go",
        "java", 
      },
      highlight = { enable = true },
      indent = { enable = true },
      auto_install = true,
    },
  },

  -- CMP (Autocompletion)
  { "hrsh7th/nvim-cmp", lazy = false },
  { "hrsh7th/cmp-buffer", lazy = false },
  { "hrsh7th/cmp-nvim-lsp", lazy = false },
  { "hrsh7th/cmp-nvim-lua", lazy = false },

  -- Snippets
  { "L3MON4D3/LuaSnip", lazy = false },
  { "saadparwaiz1/cmp_luasnip", lazy = false },
  { "rafamadriz/friendly-snippets", lazy = false },

  -- Autopairs
  { "windwp/nvim-autopairs", lazy = false },
  { "mfussenegger/nvim-dap", lazy = false },
  { "rcarriga/nvim-dap-ui", lazy = false, dependencies = { "mfussenegger/nvim-dap" } },
  { "mfussenegger/nvim-jdtls", lazy = false },

  -- Database Support
  { "tpope/vim-dadbod", lazy = false },
  { "kristijanhusak/vim-dadbod-ui", lazy = false, dependencies = { "tpope/vim-dadbod" } },
  { "kristijanhusak/vim-dadbod-completion", lazy = false },

  -- Mason: ensure java tools are installed
  {
    "williamboman/mason.nvim",
    lazy = false,
    opts = {
      ensure_installed = {
        "jdtls",
        "google-java-format",
        "java-debug-adapter",
        "java-test",
        "spring-boot-ls",
      },
    },
  },
}
