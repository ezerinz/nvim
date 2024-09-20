local Plugin = { "nvim-neo-tree/neo-tree.nvim" }

Plugin.branch = "v3.x"

Plugin.dependencies = {
  "nvim-lua/plenary.nvim",
  "nvim-tree/nvim-web-devicons",
  "MunifTanjim/nui.nvim",
}

Plugin.cmd = "Neotree"

Plugin.keys = {
  { "<leader>nt", "<cmd>Neotree toggle<CR>" },
  { "<leader>nm", "<cmd>Neotree focus<CR>" },
}

Plugin.opts = {
  window = {
    position = "left",
    width = 29,
  },
  event_handlers = {
    {
      event = "neo_tree_popup_input_ready",
      handler = function(args)
        vim.cmd("startinsert")
        vim.keymap.set("i", "<esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
      end,
    },
  },
  filesystem = {
    follow_current_file = {
      enabled = true,
    },
  },
}

return Plugin
