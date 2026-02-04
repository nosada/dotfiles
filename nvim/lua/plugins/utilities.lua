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
      messages = {
        view = "mini",
        view_warn = "mini",
        view_error = "mini",
      }
    },
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },
    config = function()
      require("telescope").setup({
        extensions = {
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
          }
        }
      })
      require("telescope").load_extension("fzf")
    end,
  },
}
