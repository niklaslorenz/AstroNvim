return {
  "tadmccorkle/markdown.nvim",
  ft = "markdown", -- or 'event = "VeryLazy"'
  opts = {
    -- configuration here or empty for defaults
  },
  keys = {
    { "<leader>xx", "<cmd>MDTaskToggle<cr>", desc = "Toggle markdown task", mode = { "n" } },
  },
}
