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
          ["Ü"] = { "<C-y>", silent = true, remap = true, desc = "Scroll" },
          ["Ä"] = { "<C-e>", silent = true, remap = true, desc = "Scroll" },
          ["<Leader>r"] = { desc = "Resize Window" },
          ["<Leader>rh"] = { desc = "Resize horizontal" },
          ["<Leader>rv"] = { desc = "Resize vertical" },
          ["<Leader>rh+"] = { ":vertical resize +10<CR>", silent = true, desc = "Increase window width" },
          ["<Leader>rh-"] = { ":vertical resize -10<CR>", silent = true, desc = "Decrease window width" },
          ["<Leader>rv+"] = { ":resize +5<CR>", silent = true, desc = "Increase window height" },
          ["<Leader>rv-"] = { ":resize -5<CR>", silent = true, desc = "Decrease window height" },
        },
        i = {
          ["<C-h>"] = { "<LEFT>", silent = true, desc = "left" },
          ["<C-j>"] = { "<DOWN>", silent = true, desc = "down" },
          ["<C-k>"] = { "<UP>", silent = true, desc = "up" },
          ["<C-l>"] = { "<RIGHT>", silent = true, desc = "right" },
        },
      },
    },
  },
}
