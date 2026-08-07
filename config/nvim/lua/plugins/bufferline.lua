return {
  "akinsho/bufferline.nvim",
  -- enabled = false,
  opts = {
    options = {
      -- always_show_bufferline = true,
      indicator = { icon = "", style = "underline" },
      separator_style = { "", "" },
      offsets = {
        {
          filetype = "snacks_layout_box",
          text = function()
            return vim.fn.getcwd()
          end,
          highlight = "Directory",
          text_align = "center",
        },
      },
    },
  },
}
