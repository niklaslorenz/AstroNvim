return {
  {
    requirements = {
      "nvim-lua/plenary.nvim",
    },

    "milanglacier/minuet-ai.nvim",
    opts = {
      provider_options = {
        codestral = {
          api_key = "CODESTRAL_API_KEY",
          stream = true,
          optional = {
            max_tokens = 256,
            stop = { "\n\n" },
          },
        },
      },
      virtualtext = {
        auto_trigger_ft = {},
        keymap = {
          accept = "<A-a>",
          dismiss = "<A-d>",
          accept_line = "<A-l>",
          next = "<A-n>",
          prev = "<A-m>",
        },
      },
    },
    config = function(_, opts) require("minuet").setup(opts) end,
  },
}
