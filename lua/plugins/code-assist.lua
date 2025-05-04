return {
  "niklaslorenz/code-assist.nvim",
  --- @type CodeAssistOptions
  opts = {
    model = "gpt-4o-mini",
    system_message = "You are a helpful programming assistant.",
    relative_chat_width = 0.4,
    relative_chat_height = 0.4,
    relative_chat_input_width = 0.4,
    relative_chat_input_height = 0.4,
  },
  lazy = false,
  keys = {},
  branch = "dev",
}
