return {
  {
    "nvim-mini/mini.splitjoin",
    version = "*",
    opts = {
      mappings = {
        toggle = "",
        split = "<leader>js",
        join = "<leader>jj",
      },
    },
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        {
          mode = { "n", "x" },
          { "<leader>j", group = "splitjoin" },
        },
      },
    },
  },
}
