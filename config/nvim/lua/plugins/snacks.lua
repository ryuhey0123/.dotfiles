return {
  "snacks.nvim",
  opts = {
    picker = {
      hidden = true,
      ignored = false,
      exclude = {
        ".git",
        ".DS_Store",
        ".vscode",
        ".zed",
      },
    },
    scroll = {
      animate = {
        duration = { step = 10, total = 100 },
        easing = "linear",
      },
    },
    notifier = {
      timeout = 5000,
    },
  },
}
