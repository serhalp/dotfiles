return {
  {
    "kylechui/nvim-surround",
    version = "*",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup({
      })
    end
  },
  {
    "tpope/vim-fugitive",
    event = "VeryLazy",
  },
  {
    "tpope/vim-rhubarb",
    event = "VeryLazy",
  },
  {
    "nvim-pack/nvim-spectre",
    event = "VeryLazy",
    opts = {
      replace_engine = {
        ["sed"] = {
          cmd = "sed",
          args = {
            "-i",
            "",
            "-E",
          },
        },
      },
      default = {
        find = {
          cmd = "ag",
          options = { "hidden" }
        },
        replace = {
          cmd = "sed"
        }
      },
    }
  }
}
