-- Note: this is where you can add plugins that don't require any configuration.
-- as soon as you need to add options to a plugin consider making a dedicated file.

local Plugins = {
  { "nvim-tree/nvim-web-devicons", lazy = true },
  { "frostplexx/mason-bridge.nvim", event = "VeryLazy", opts = {} },
  { "NStefan002/screenkey.nvim", cmd = "Screenkey", version = "*" },
  { "echasnovski/mini.pairs", event = "InsertEnter", opts = {} },
  -- { "linux-cultist/venv-selector.nvim", opts = {}, cmd = { "VenvSelect", "VenvSelectCached" } }, -- waiting until venv-selector have fzf support

  -- colorscheme
  { "ellisonleao/gruvbox.nvim", priority = 1000 },
  { "folke/tokyonight.nvim", priority = 1000 },
}

return Plugins
