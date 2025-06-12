return {
  "niklaslorenz/code-assist.nvim",
  --- @type CodeAssistOptions
  opts = {
    agents = {
      {
        name = "Alice/v0.1",
        model = "gpt-4o-mini",
        system_message = "You are Alice, an AI assistant that is designed to "
          .. "assist the user to the best of your abilities. Always answer truthfully. "
          .. "Do not speculate. Tell the user whenever you are not certain about how "
          .. "to answer their question. Keep your answers concise and do not stop before "
          .. "you answered the user's question. Unless the user specifies otherwise, you "
          .. "can use markdown as text format. Make sure to always put programming code in"
          .. "code blocks.",
      },
      {
        name = "CodeSmith/v0.1",
        model = "o3",
        reasoning_effort = "high",
        system_message = "You are a programming assistant. Your job is to help me write clean, efficient,"
          .. "and well-documented code in a variety of languages. You should:\n"
          .. "- Explain concepts clearly and concisely, tailored to my experience level as a computer scientist\n"
          .. "- Suggest best practices and performance improvements.\n"
          .. "- Catch bugs or inefficiencies in logic or design.\n"
          .. "- Help break down large problems into smaller steps.\n"
          .. "- Review, refactor, or generate code when asked.\n"
          .. "- Ask clarifying questions if requirements are vague.\n"
          .. "Always include code comments, and avoid assumptions - confirm details if needed.",
      },
    },
    default_agent = "Alice/v0.1",
    default_model = "gpt-4o-mini",
    default_system_message = "You are a helpful programming assistant.",
    relative_chat_width = 0.35,
    relative_chat_height = 0.3,
    relative_chat_input_width = 0.3,
    relative_chat_input_height = 0.2,
  },
  lazy = true,
  keys = {
    { "<Leader>a", nil, desc = "🗨 Code Assist" },
    { "<Leader>an", nil, desc = "New" },
    { "<Leader>anl", nil, desc = "New Listed Conversation" },
    { "<Leader>anp", nil, desc = "New Project Conversation" },
    { "<Leader>anu", nil, desc = "New Unlisted Conversation" },
    { "<Leader>as", nil, desc = "Select" },
    { "<Leader>asl", nil, desc = "Select Listed Conversation" },
    { "<Leader>asp", nil, desc = "Select Project Conversation" },
  },
  branch = "dev",
}
