-- You can also add or configure plugins by creating files in this `plugins/` folder

---@type LazySpec
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
