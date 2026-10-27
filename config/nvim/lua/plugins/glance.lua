return {
  {
    "dnlhc/glance.nvim",
    cmd = "Glance",
    keys = {
      { "gpy", "<cmd>Glance type_definitions<cr>", desc = "Peek type definition" },
      { "gpd", "<cmd>Glance definitions<cr>", desc = "Peek definition" },
      { "gpr", "<cmd>Glance references<cr>", desc = "Peek references" },
      { "gpi", "<cmd>Glance implementations<cr>", desc = "Peek implementations" },
    },
    opts = {},
  },
  {
    "folke/which-key.nvim",
    opts = {
      spec = {
        { "gp", group = "peek" },
      },
    },
  },
}
