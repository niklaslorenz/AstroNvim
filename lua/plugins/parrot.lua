local function load_prompt(name)
  local path = vim.fn.stdpath("config") .. "/prompts/" .. name .. ".md"
  return table.concat(vim.fn.readfile(path), "\n")
end

-- Personalized Config
if true then
  local Job = require("plenary.job")
  local _hooks = {
    Complete = function(prt, params)
      local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted."
        ]]
      local model_obj = prt.get_model("command")
      prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
    end,
    CompleteFullContext = function(prt, params)
      local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{filecontent}}
        ```

        Please look at the following section specifically:
        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted.
        ]]
      local model_obj = prt.get_model("command")
      prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
    end,
    CompleteMultiContext = function(prt, params)
      local template = [[
        I have the following code from {{filename}} and other realted files:

        ```{{filetype}}
        {{multifilecontent}}
        ```

        Please look at the following section specifically:
        ```{{filetype}}
        {{selection}}
        ```

        Please finish the code above carefully and logically.
        Respond just with the snippet of code that should be inserted.
        ]]
      local model_obj = prt.get_model("command")
      prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
    end,
    Explain = function(prt, params)
      local template = [[
        Your task is to take the code snippet from {{filename}} and explain it with gradually increasing complexity.
        Break down the code's functionality, purpose, and key components.
        The goal is to help the reader understand what the code does and how it works.

        ```{{filetype}}
        {{selection}}
        ```

        Use the markdown format with codeblocks and inline code.
        Explanation of the code above:
        ]]
      local model = prt.get_model("command")
      prt.logger.info("Explaining selection with model: " .. model.name)
      prt.Prompt(params, prt.ui.Target.new, model, nil, template)
    end,
    FixBugs = function(prt, params)
      local template = [[
        You are an expert in {{filetype}}.
        Fix bugs in the below code from {{filename}} carefully and logically:
        Your task is to analyze the provided {{filetype}} code snippet, identify
        any bugs or errors present, and provide a corrected version of the code
        that resolves these issues. Explain the problems you found in the
        original code and how your fixes address them. The corrected code should
        be functional, efficient, and adhere to best practices in
        {{filetype}} programming.

        ```{{filetype}}
        {{selection}}
        ```

        Fixed code:
        ]]
      local model_obj = prt.get_model("command")
      prt.logger.info("Fixing bugs in selection with model: " .. model_obj.name)
      prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
    end,
    Optimize = function(prt, params)
      local template = [[
        You are an expert in {{filetype}}.
        Your task is to analyze the provided {{filetype}} code snippet and
        suggest improvements to optimize its performance. Identify areas
        where the code can be made more efficient, faster, or less
        resource-intensive. Provide specific suggestions for optimization,
        along with explanations of how these changes can enhance the code's
        performance. The optimized code should maintain the same functionality
        as the original code while demonstrating improved efficiency.

        ```{{filetype}}
        {{selection}}
        ```

        Optimized code:
        ]]
      local model_obj = prt.get_model("command")
      prt.logger.info("Optimizing selection with model: " .. model_obj.name)
      prt.Prompt(params, prt.ui.Target.new, model_obj, nil, template)
    end,
    UnitTests = function(prt, params)
      local template = [[
        I have the following code from {{filename}}:

        ```{{filetype}}
        {{selection}}
        ```

        Please respond by writing table driven unit tests for the code above.
        ]]
      local model_obj = prt.get_model("command")
      prt.logger.info("Creating unit tests for selection with model: " .. model_obj.name)
      prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
    end,
    Debug = function(prt, params)
      local template = [[
        I want you to act as {{filetype}} expert.
        Review the following code, carefully examine it, and report potential
        bugs and edge cases alongside solutions to resolve them.
        Keep your explanation short and to the point:

        ```{{filetype}}
        {{selection}}
        ```
        ]]
      local model_obj = prt.get_model("command")
      prt.logger.info("Debugging selection with model: " .. model_obj.name)
      prt.Prompt(params, prt.ui.Target.enew, model_obj, nil, template)
    end,
    CommitMsg = function(prt, params)
      local futils = require("parrot.file_utils")
      if futils.find_git_root() == "" then
        prt.logger.warning("Not in a git repository")
        return
      else
        local template = [[
          I want you to act as a commit message generator. I will provide you
          with information about the task and the prefix for the task code, and
          I would like you to generate an appropriate commit message using the
          conventional commit format. Do not write any explanations or other
          words, just reply with the commit message.
          Start with a short headline as summary but then list the individual
          changes in more detail.

          Here are the changes that should be considered by this message:
          ]] .. vim.fn.system("git diff --no-color --no-ext-diff --staged")
        local model_obj = prt.get_model("command")
        prt.Prompt(params, prt.ui.Target.append, model_obj, nil, template)
      end
    end,
    SpellCheck = function(prt, params)
      local chat_prompt = load_prompt("spellcheck")
      prt.ChatNew(params, chat_prompt)
    end,
    CodeConsultant = function(prt, params)
      local chat_prompt = [[
          Your task is to analyze the provided {{filetype}} code and suggest
          improvements to optimize its performance. Identify areas where the
          code can be made more efficient, faster, or less resource-intensive.
          Provide specific suggestions for optimization, along with explanations
          of how these changes can enhance the code's performance. The optimized
          code should maintain the same functionality as the original code while
          demonstrating improved efficiency.

          Here is the code
          ```{{filetype}}
          {{filecontent}}
          ```
        ]]
      prt.ChatNew(params, chat_prompt)
    end,
    ProofReader = function(prt, params)
      local chat_prompt = [[
        I want you to act as a proofreader. I will provide you with texts and
        I would like you to review them for any spelling, grammar, or
        punctuation errors. Once you have finished reviewing the text,
        provide me with any necessary corrections or suggestions to improve the
        text. Highlight the corrected fragments (if any) using markdown backticks.

        When you have done that subsequently provide me with a slightly better
        version of the text, but keep close to the original text.

        Finally provide me with an ideal version of the text.

        Whenever I provide you with text, you reply in this format directly:

        ## Corrected text:

        {corrected text, or say "NO_CORRECTIONS_NEEDED" instead if there are no corrections made}

        ## Slightly better text

        {slightly better text}

        ## Ideal text

        {ideal text}
        ]]
      prt.ChatNew(params, chat_prompt)
    end,
  }
  return {
    "frankroeder/parrot.nvim",
    dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      -- add ollama if executable found
      if vim.fn.executable("ollama") == 1 then
        opts.providers["ollama"] = {
          name = "ollama",
          endpoint = "http://localhost:11434/api/chat",
          model_endpoint = "http://localhost:11434/api/models",
          api_key = "", -- not required for local Ollama
          params = {
            chat = { temperature = 1.5, top_p = 1, num_ctx = 8192, min_p = 0.05 },
            command = { temperature = 1.5, top_p = 1, num_ctx = 8192, min_p = 0.05 },
          },
          topic_prompt = [[
        Summarize the chat above and only provide a short headline of 2 to 3
        words without any opening phrase like "Sure, here is the summary",
        "Sure! Here's a shortheadline summarizing the chat" or anything similar.
        ]],
          topic = {
            model = "llama3",
            params = { max_tokens = 32 },
          },
          headers = {
            ["Content-Type"] = "application/json",
          },
          models = {
            "llama3",
          },
          resolve_api_key = function() return true end,
          process_stdout = function(response)
            if response:match("message") and response:match("content") then
              local ok, data = pcall(vim.json.decode, response)
              if ok and data.message and data.message.content then return data.message.content end
            end
          end,
          get_available_models = function(self)
            local url = self.endpoint:gsub("chat", "")
            local logger = require("parrot.logger")
            local job = Job:new({
              command = "curl",
              args = { "-H", "Content-Type: application/json", url .. "tags" },
            }):sync()
            local parsed_response = require("parrot.utils").parse_raw_response(job)
            self:process_onexit(parsed_response)
            if parsed_response == "" then
              logger.debug("Ollama server not running")
              return {}
            end

            local success, parsed_data = pcall(vim.json.decode, parsed_response)
            if not success then
              logger.error("Ollama - Error parsing JSON: " .. vim.inspect(parsed_data))
              return {}
            end

            if not parsed_data.models then
              logger.error("Ollama - No models found. Please use 'ollama pull' to download one.")
              return {}
            end

            local names = {}
            for _, model in ipairs(parsed_data.models) do
              table.insert(names, model.name)
            end

            return names
          end,
        }
      end
      require("parrot").setup(opts)
    end,
    opts = {
      hooks = _hooks,
      providers = {
        openai = {
          name = "openai",
          api_key = os.getenv("OPENAI_API_KEY"),
          endpoint = "https://api.openai.com/v1/chat/completions",
          topic = {
            model = "gpt-5-nano",
            params = { max_completion_tokens = 64 },
          },
          models = {
            "gpt-5-mini",
            "gpt-5-nano",
            "gpt-5.3-codex",
          },
        },
      },
    },
  }
end

-- Basic Config

return {
  "frankroeder/parrot.nvim",
  dependencies = { "ibhagwan/fzf-lua", "nvim-lua/plenary.nvim" },
  -- optionally include "folke/noice.nvim" or "rcarriga/nvim-notify" for beautiful notifications
  config = function()
    require("parrot").setup({
      -- Providers must be explicitly set up to make them available.
      providers = {
        openai = {
          name = "openai",
          api_key = os.getenv("OPENAI_API_KEY"),
          endpoint = "https://api.openai.com/v1/chat/completions",
          topic = {
            model = "gpt-5-nano",
            params = { max_completion_tokens = 64 },
          },
          models = {
            "gpt-5-mini",
            "gpt-5-nano",
            "gpt-5.3-codex",
          },
        },
      },
    })
  end,
}
