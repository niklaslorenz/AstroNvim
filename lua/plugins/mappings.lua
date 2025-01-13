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
        },
      },
    },
  },
}
