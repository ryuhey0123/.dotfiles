return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          ".vscode",
          ".zed",
        },
        never_show = {
          ".git",
          ".DS_Store",
        },
      },
    },
  },
}
