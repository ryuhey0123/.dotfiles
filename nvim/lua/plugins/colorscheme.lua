return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin-nvim",
    },
  },
  {
    "folke/tokyonight.nvim",
    opts = {
      style = "night",
      dim_inactive = true,
      hide_inactive_statusline = true,
      transparent = true,
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
    },
  },
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    opts = {
      flavour = "auto",
      transparent_background = true,
      float = {
        transparent = true,
        solid = true,
      },
      -- dim_inactive = {
      --   enabled = true,
      --   shade = "dark",
      --   percentage = 0.15,
      -- },
      custom_highlights = function(colors)
        return {
          Comment = { fg = colors.overlay0 },
        }
      end,
    },
  },

  -- border highlight when background is transparent
  {
    "saghen/blink.cmp",
    opts = {
      completion = {
        documentation = {
          window = {
            border = "rounded",
            winblend = 15,
          },
        },
        menu = {
          border = "single",
          winblend = 15,
        },
      },
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      presets = {
        lsp_doc_border = true, -- add a border to hover docs and signature help
      },
    },
  },
  {
    "mason-org/mason.nvim",
    opts = {
      ui = {
        border = "rounded",
      },
    },
  },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        float = {
          border = "rounded",
        },
      },
    },
  },
}
