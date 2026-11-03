return {
  {
    "abecodes/tabout.nvim",
    lazy = false,
    event = "InsertCharPre", -- Set the event to 'InsertCharPre' for better compatibility
    priority = 1000,
    opts = {
      -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      tabkey = "<Tab>",

      -- key to trigger backwards tabout, set to an empty string to disable
      backwards_tabkey = "<S-Tab>",

      -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      act_as_tab = true,

      -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      act_as_shift_tab = false,

      -- shift default action (only at the beginning of a line, otherwise <TAB> is used)
      default_tab = "<C-t>",

      -- reverse shift default action,
      default_shift_tab = "<C-d>",

      -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      enable_backwards = true,

      -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      completion = false,

      tabouts = {
        { open = "'", close = "'" },
        { open = '"', close = '"' },
        { open = "`", close = "`" },
        { open = "(", close = ")" },
        { open = "[", close = "]" },
        { open = "{", close = "}" },
      },

      --[[ if the cursor is at the beginning of a filled element it will rather tab out than shift the content ]]
      ignore_beginning = true,

      -- reverse shift content if tab out is not possible (if your keyboard/terminal supports <S-Tab>)
      exclude = {},
    },
  },
}
