-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- AstroCommunity: import any community modules here
-- We import this file in `lazy_setup.lua` before the `plugins/` folder.
-- This guarantees that the specs are processed before any user plugins.

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  -- import/override with your plugins folder
  { import = "astrocommunity.colorscheme.catppuccin" },
  { import = "astrocommunity.colorscheme.cyberdream-nvim" },
  { import = "astrocommunity.color.transparent-nvim" },
  { import = "astrocommunity.pack.python" },
  { import = "astrocommunity.pack.lua" },
  { import = "astrocommunity.pack.markdown" },
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.rust" },
  { import = "astrocommunity.pack.java" },
  { import = "astrocommunity.markdown-and-latex.glow-nvim" },
  { import = "astrocommunity.markdown-and-latex.render-markdown-nvim" },
  { import = "astrocommunity.motion.flash-nvim" },
  { import = "astrocommunity.test.vim-test" },
  -- { import = "astrocommunity.test.neotest" }, -- Neotest does not work on windows for python because of hard coded paths
  { import = "astrocommunity.test.nvim-coverage" },
  -- { import = "astrocommunity.workflow.bad-practices-nvim" },
  { import = "astrocommunity.workflow.hardtime-nvim" },
  -- { import = "astrocommunity.workflow.precognition-nvim" },
}
