return {
  "dmtrKovalenko/fff.nvim",
  build = function()
    require("fff.download").download_or_build_binary()
  end,
  lazy = false, -- the plugin lazy-initialises itself
  keys = {
    {
      "<leader><space>",
      function()
        require("fff").find_files()
      end,
      desc = "FFFind files",
    },
    -- {
    --   "<leader>sg",
    --   function()
    --     require("fff").live_grep()
    --   end,
    --   desc = "LiFFFe grep",
    -- },
    -- {
    --   "<leader>sz",
    --   function()
    --     require("fff").live_grep({ grep = { modes = { "fuzzy", "plain" } } })
    --   end,
    --   desc = "Live fffuzy grep",
    -- },
    -- {
    --   "<leader>sw",
    --   function()
    --     require("fff").live_grep_under_cursor()
    --   end,
    --   mode = { "n", "x" },
    --   desc = "Search current word / selection",
    -- },
  },
  opts = {
    layout = {
      -- height = 0.8,
      -- width = 0.8,
      prompt_position = "top", -- or 'top'
      -- preview_position = "right", -- 'left' | 'right' | 'top' | 'bottom'
      -- preview_size = 0.5,
      -- Border style for the picker windows. Leave unset (nil) to follow the
      -- global `vim.o.winborder`; set it to override fff's borders independently.
      border = "rounded", -- 'single' | 'double' | 'rounded' | 'solid' | 'shadow' | 'none'
      -- flex = { size = 130, wrap = "top" },
      -- min_list_height = 10, --  do not display anything except the list below this threshold
      -- show_scrollbar = true,
      -- path_shorten_strategy = "middle_number", -- 'middle_number' | 'middle' | 'end' | 'start'
      -- anchor = "center",
    },
    preview = {
      enabled = true,
      -- max_size = 10 * 1024 * 1024,
      -- chunk_size = 8192,
      -- binary_file_threshold = 1024,
      -- imagemagick_info_format_str = "%m: %wx%h, %[colorspace], %q-bit",
      line_numbers = true,
      -- cursorlineopt = "both",
      -- wrap_lines = false,
      -- filetypes = {
      --   svg = { wrap_lines = true },
      --   markdown = { wrap_lines = true },
      --   text = { wrap_lines = true },
      -- },
    },
    git = {
      status_text_color = true, -- true to color filenames by git status
    },
    grep = {
      -- max_file_size = 10 * 1024 * 1024,
      -- max_matches_per_file = 100,
      -- smart_case = true,
      -- time_budget_ms = 150,
      -- modes = { "plain", "regex", "fuzzy" },
      trim_whitespace = true,
      -- enable_filename_constraint = false, -- treat filename-like tokens (e.g. `score.rs`) in a grep query as a file-path filter scoping the search; off = searched as literal text
      location_format = "%d", -- printf format for line:col prefix in grep results, e.g. ':%d' for line-only
    },
  },
}
