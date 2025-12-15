return {
  {
    "nvim-neotest/neotest",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "antoinemadec/FixCursorHold.nvim", -- recommended by neotest
      "nvim-neotest/neotest-python", -- Python adapter
    },
    opts = {
      adapters = {
        require("neotest-python")({
          -- optional extra args
          dap = { justMyCode = false },
          runner = "pytest",
          python = "python",
          args = { "--maxfail=1", "--disable-warnings" },
        }),
      },
    },
  },
}
