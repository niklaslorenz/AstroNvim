return {
  {
    "AstroNvim/astrocore",
    ---@type AstroCoreOpts
    opts = {
      mappings = {
        t = {
          ["<Esc>"] = { "<c-\\><C-n>", desc = "Escape Terminal Mode" },
        },
        n = {
          ["<Tab>"] = { ":bnext<CR>" },
          ["<S-Tab>"] = { ":bprevious<CR>" },
          ["<Leader>ui"] = {
            function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 }) end,
            silent = true,
            desc = "Toggle inlay hints",
          },
          ["<Leader>lf"] = { function() vim.lsp.buf.format() end, silent = true, desc = "Format buffer" },
          ["ü"] = { "[", silent = true, remap = true, desc = "Previous" },
          ["ä"] = { "]", silent = true, remap = true, desc = "Next" },
          ["Ü"] = { "5<C-y>", silent = true, desc = "Scroll up 5" },
          ["Ä"] = { "5<C-e>", silent = true, desc = "Scroll down 5" },
          ["+h"] = { ":vertical resize +10<CR>", silent = true, desc = "Increase window width" },
          ["-h"] = { ":vertical resize -10<CR>", silent = true, desc = "Decrease window width" },
          ["+v"] = { ":resize +5<CR>", silent = true, desc = "Increase window height" },
          ["-v"] = { ":resize -5<CR>", silent = true, desc = "Decrease window height" },
        },
      },
    },
  },
}
