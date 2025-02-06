-- if true then return end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- This will run last in the setup process and is a good place to configure
-- things like custom filetypes. This is just pure lua so anything that doesn't
-- fit in the normal config locations above can go here

-- Set up custom filetypes
-- vim.filetype.add({
--   extension = {
--     foo = "fooscript",
--   },
--   filename = {
--     ["Foofile"] = "fooscript",
--   },
--   pattern = {
--     ["~/%.config/foo/.*"] = "fooscript",
--   },
-- })

local map = vim.keymap.set
local opts = { remap = true, silent = true }

-- Normal mode
map("n", "ü", "[", opts)
map("n", "ä", "]", opts)

-- Visual mode
map("v", "ü", "[", opts)
map("v", "ä", "]", opts)

-- Set python environment to handle utf-8 symbols for latex2text
vim.env.PYTHONUTF8 = "1"

-- Refresh Markdown View when reading buffer
vim.api.nvim_create_autocmd({ "BufReadPost", "InsertLeave" }, {
  pattern = "*.md",
  callback = function()
    if vim.fn.exists(":RenderMarkdown") == 2 then vim.cmd("RenderMarkdown") end
  end,
})
