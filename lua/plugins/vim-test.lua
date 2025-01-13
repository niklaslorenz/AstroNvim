return {
  "jankoatwork/vim-test", -- vim-test plugin
  ft = "python", -- Only load for Python files
  event = "VeryLazy", -- Lazy load when required
  config = function()
    -- Set pytest options for coverage
    vim.g["test#python#pytest#options"] = "--cov=."
  end,
}
