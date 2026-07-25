return {
  {
    "nvim-mini/mini.files",
    opts = {
      windows = {
        preview = true,
        width_focus = 30,
        width_preview = 120,
      },
      options = {
        -- Whether to use for editing directories
        -- Disabled by default in LazyVim because neo-tree is used for that
        use_as_default_explorer = false,
      },
    },
    -- keys = {
    --   { "<leader>e", "<leader>fm", desc = "Open mini.files (Directory of Current File)", remap = true },
    --   { "<leader>E", "<leader>fM", desc = "Open mini.files (cwd)", remap = true },
    -- },
  },
}
