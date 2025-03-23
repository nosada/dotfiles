return {
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.icons",
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local theme = require("alpha.themes.dashboard")
      require("alpha").setup(
        theme.config
      )
    end,
  },
  {
    "Shatur/neovim-session-manager",
    config = function()
      local config = require('session_manager.config')
      require('session_manager').setup({
        autoload_mode = config.AutoloadMode.Disabled,
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  },
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    opts = {},
  },
  {
    "folke/which-key.nvim",
  },
  {
    "cohama/lexima.vim",
  },
  {
    "lewis6991/gitsigns.nvim",
  },
  {
    "f-person/git-blame.nvim",
  },
  {
    "williamboman/mason.nvim",
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    }
  },
  {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("nvim-treesitter.configs").setup({
        sync_install = true,
        highlight = {
          enable = true,
        },
        indent = {
          enable = true,
        },
      })
    end,
    build = ":TSUpdate",
  },
  {
    "nvimdev/indentmini.nvim",
    opts = {},
  },
}
