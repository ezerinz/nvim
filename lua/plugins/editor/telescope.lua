-- telescope
return {
  'nvim-telescope/telescope.nvim',
  version = '0.1.0',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  cmd = "Telescope",
  keys = {
    {"<leader>ff", "<cmd>Telescope find_files<CR>"},
    {"<leader>fg", "<cmd>Telescope live_grep<CR>"},
    {"<leader>fr", "<cmd>Telescope oldfiles<CR>"},
  },
  opts = {
    defaults = {
      mappings = {
        i = {
          ['<esc>'] = function(...)
            require("telescope.actions").close(...)
          end,
          ['<C-k>'] = function(...)
            require("telescope.actions").move_selection_previous(...)
          end,
          ['<C-j>'] = function(...)
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
  },
}


