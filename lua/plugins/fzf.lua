local Plugin = { "ibhagwan/fzf-lua" }

Plugin.cmd = "FzfLua"

Plugin.keys = {
  { "<leader>ff", "<cmd>FzfLua files<CR>" },
  { "<leader>fg", "<cmd>FzfLua live_grep<CR>" },
  { "<leader>fr", "<cmd>FzfLua oldfiles<CR>" },
}
Plugin.dependencies = { "nvim-tree/nvim-web-devicons" }
Plugin.config = function()
  require("fzf-lua").setup({
    { "telescope" },
    winopts = {
      on_create = function()
        vim.keymap.set("t", "<C-j>", "<Down>", { silent = true, buffer = true })
        vim.keymap.set("t", "<C-k>", "<Up>", { silent = true, buffer = true })
      end,
    },
  })
end

return Plugin
