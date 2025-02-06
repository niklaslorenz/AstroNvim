return {
  "tadmccorkle/markdown.nvim",
  ft = "markdown", -- or 'event = "VeryLazy"'
  opts = {
    -- configuration here or empty for defaults
  },
  keys = {
    { "<leader>xx", "<cmd>MDTaskToggle<cr>", mode = { "n" }, desc = "Toggle markdown task" },
    { "<leader>vt", "<cmd>MDToc<cr>", mode = { "n" }, desc = "Show Table of Content" },
  },
}
