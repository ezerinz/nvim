local Plugin = { "folke/snacks.nvim" }

Plugin.priority = 1000

Plugin.lazy = false

Plugin.opts = {
  bigfile = { enabled = false },
  dashboard = { enabled = true }, -- configuration in dashboard.lua
  indent = { enabled = true }, -- configuration in indent.lua
  input = { enabled = true },
  notifier = { enabled = true },
  quickfile = { enabled = false },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  words = { enabled = true },
}

Plugin.keys = {
  {
    "<leader>bd",
    function()
      Snacks.bufdelete()
    end,
    desc = "Delete Buffer",
  },
  {
    "<leader>un",
    function()
      Snacks.notifier.hide()
    end,
    desc = "Dismiss All Notifications",
  },
  {
    "]]",
    function()
      Snacks.words.jump(vim.v.count1)
    end,
    desc = "Next Reference",
    mode = { "n", "t" },
  },
  {
    "[[",
    function()
      Snacks.words.jump(-vim.v.count1)
    end,
    desc = "Prev Reference",
    mode = { "n", "t" },
  },
}

function Plugin.init()
  vim.api.nvim_create_autocmd("User", {
    pattern = "VeryLazy",
    callback = function()
      -- Setup some globals for debugging (lazy-loaded)
      _G.dd = function(...)
        Snacks.debug.inspect(...)
      end
      _G.bt = function()
        Snacks.debug.backtrace()
      end
      vim.print = _G.dd -- Override print to use snacks for `:=` command

      Snacks.toggle.option("background", { off = "light", on = "dark", name = "Dark Background" }):map("<leader>ub")
      Snacks.toggle.inlay_hints():map("<leader>uh")
      -- indent highlight
      vim.api.nvim_set_hl(0, "SnacksIndent1", { fg = "#E06C75" })
      vim.api.nvim_set_hl(0, "SnacksIndent2", { fg = "#E5C07B" })
      vim.api.nvim_set_hl(0, "SnacksIndent3", { fg = "#D19A66" })
      vim.api.nvim_set_hl(0, "SnacksIndent4", { fg = "#98C379" })
      vim.api.nvim_set_hl(0, "SnacksIndent5", { fg = "#C678DD" })
    end,
  })
end

return Plugin
