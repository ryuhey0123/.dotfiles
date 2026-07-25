return {
  -- 挙動がおかしいので不要
  { "MeanderingProgrammer/render-markdown.nvim", enabled = false },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        ["markdown"] = { "oxfmt", "markdownlint-cli2", "markdown-toc" },
        ["markdown.mdx"] = { "oxfmt", "markdownlint-cli2", "markdown-toc" },
      },
    },
  },
  {
    "mfussenegger/nvim-lint",
    opts = {
      -- ensure しないとダメかも
      linters = {
        ["markdownlint-cli2"] = {
          prepend_args = { "--config", vim.fn.stdpath("config") .. "/.markdownlint-cli2.yaml", "--" },
        },
      },
    },
  },
}
