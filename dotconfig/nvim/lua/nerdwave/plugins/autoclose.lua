return {
  "m4xshen/autoclose.nvim",
  lazy = true, event = "InsertEnter",
  opts = {
    keys = {
      ["("] = { escape = false, close = true, pair = "()" },
      ["["] = { escape = false, close = true, pair = "[]" },
      ["{"] = { escape = false, close = true, pair = "{}" },

      ["<"] = { escape = true, close = false, pair = "<>" },
      [">"] = { escape = true, close = false, pair = "<>" },
      [")"] = { escape = true, close = false, pair = "()" },
      ["]"] = { escape = true, close = false, pair = "[]" },
      ["}"] = { escape = true, close = false, pair = "{}" },

      ['"'] = { escape = true, close = false, pair = '""' },
      ["`"] = { escape = true, close = false, pair = "``" },
      ["'"] = { escape = true, close = false, pair = "''" },
    },
    options = {
      disabled_filetypes = { "big_file_disabled_ft" },
      disable_when_touch = false,
    },
  }
}
