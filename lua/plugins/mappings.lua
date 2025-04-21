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
          ["<Leader>ui"] = function() vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ 0 }), { 0 }) end,
          ["ü"] = { "[", silent = true, remap = true, desc = "Previous" },
          ["ä"] = { "]", silent = true, remap = true, desc = "Next" },
          ["Ü"] = { "5<C-y>", silent = true, desc = "Scroll up 5" },
          ["Ä"] = { "5<C-e>", silent = true, desc = "Scroll down 5" },
        },
      },
    },
  },
}
