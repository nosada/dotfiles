return {
  {
    "goolord/alpha-nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      "echasnovski/mini.icons",
      "Shatur/neovim-session-manager",
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
    build = function()
      require("nvim-treesitter.install").update({
        with_sync = true
      })()
    end,
  },
}
