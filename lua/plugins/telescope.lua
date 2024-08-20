local Plugin = { "nvim-telescope/telescope.nvim" }

Plugin.dependencies = {
  "nvim-lua/plenary.nvim",
}

Plugin.cmd = "Telescope"

Plugin.keys = {
  { "<leader>ff", "<cmd>Telescope find_files<CR>" },
  { "<leader>fg", "<cmd>Telescope live_grep<CR>" },
  { "<leader>fr", "<cmd>Telescope oldfiles<CR>" },
}

Plugin.opts = {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = function(...)
          require("telescope.actions").close(...)
        end,
        ["<C-k>"] = function(...)
          require("telescope.actions").move_selection_previous(...)
        end,
        ["<C-j>"] = function(...)
          require("telescope.actions").move_selection_next(...)
        end,
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
  },
}

Plugin.config = function(_, opts)
  require("telescope").setup(opts)
  require("telescope").load_extension("flutter")
end

return Plugin
