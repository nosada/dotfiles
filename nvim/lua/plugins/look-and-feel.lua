return {
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "storm",
      transparent = true,
      styles = {
        sidebars = "transparent",
        keywords = { bold = true },
        functions = { bold = true },
        floats = "transparent",
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
  }
}
