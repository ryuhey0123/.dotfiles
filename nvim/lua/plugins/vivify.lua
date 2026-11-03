return {
  {
    "iamcco/markdown-preview.nvim",
    enabled = false,
  },
  {
    "jannis-baum/vivify.vim",
    cmd = { "Vivify" },
    ft = { "markdown" },
    keys = {
      {
        "<leader>cp",
        ft = "markdown",
        "<cmd>Vivify<cr>",
        desc = "Vivify Markdown preview",
      },
    },
  },
}
