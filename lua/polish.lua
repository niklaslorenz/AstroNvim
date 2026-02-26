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

-- Set python environment to handle utf-8 symbols for latex2text
vim.env.PYTHONUTF8 = "1"

-- Refresh Markdown View when reading buffer
vim.api.nvim_create_autocmd({ "BufReadPost", "InsertLeave" }, {
  pattern = "*.md",
  callback = function()
    if vim.fn.exists(":RenderMarkdown") == 2 then vim.cmd("RenderMarkdown") end
  end,
})

-- Rerender diagnostics after write when autosave disabled it
local function redraw_diagnostics()
  if vim.diagnostic.is_enabled({ bufnr = 0 }) then vim.diagnostic.show(nil, 0) end
end

vim.api.nvim_create_autocmd("BufWritePost", {
  callback = function() vim.defer_fn(redraw_diagnostics, 100) end,
})

-- NOTE: Enable async autocompletions for all lsps
require("cmp").setup({ async = true })

-- NOTE: The java lsp takes very long to create autocompletions,
-- so putting it on async prevents a lot of lag.

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = "java",
--   callback = function()
--     require("cmp").setup.buffer({
--       async = true,
--     })
--   end,
-- })
