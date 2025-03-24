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
      local config = require("session_manager.config")
      require("session_manager").setup({
        autoload_mode = config.AutoloadMode.Disabled,
      })
    end,
  },
  {
    "akinsho/bufferline.nvim",
    opts = {},
  },
  {
    "nvim-tree/nvim-tree.lua",
    opts = {},
  },
  {
    "folke/which-key.nvim",
    opts = {},
  },
  {
    "cohama/lexima.vim",
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {},
  },
  {
    "f-person/git-blame.nvim",
    opts = {},
  },
  {
    "williamboman/mason.nvim",
    opts = {},
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    opts = {
      automatic_installation = true,
    },
    config = function()
      require("mason-lspconfig").setup_handlers({
        function(server_name)
          require("lspconfig")[server_name].setup({})
        end,
      })
    end
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
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
      "hrsh7th/nvim-cmp",
    },
    opts = {
      presets = {
        bottom_search = true,
        command_palette = false,
        long_message_to_split = false,
        lsp_doc_border = false,
      },
      cmdline = {
        view = "cmdline",
      },
    },
  },
  {
    "folke/trouble.nvim",
    opts = {},
  },
  {
    "j-hui/fidget.nvim",
    opts = {},
  },
}
