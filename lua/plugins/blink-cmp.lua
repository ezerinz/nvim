-- completion plugin
local Plugin = { "saghen/blink.cmp" }

Plugin.event = "InsertEnter"

Plugin.version = "*"
-- AND/OR build from source, requires nightly: https://rust-lang.github.io/rustup/concepts/channels.html#working-with-nightly-rust
-- Plugin.build = 'cargo build --release'

Plugin.dependencies = { "rafamadriz/friendly-snippets" }

Plugin.opts = {
  keymap = {
    preset = "enter",
    ["<C-d>"] = { "snippet_forward" },
    ["<C-a>"] = { "snippet_backward" },
    ["<Tab>"] = { "select_next" },
    ["<S-Tab>"] = { "select_prev" },
  },
  appearance = {
    use_nvim_cmp_as_default = false,
    nerd_font_variant = "mono",
  },
  completion = {
    list = {
      selection = {
        preselect = false,
        auto_insert = function(ctx)
          return ctx.mode == "cmdline"
        end,
      },
    },
    menu = { border = "rounded" },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = { border = "rounded" },
    },
  },
  signature = { window = { border = "rounded" } },
  snippets = {
    preset = "luasnip",
  },
  sources = {
    default = { "lsp", "path", "snippets", "buffer", "lazydev" },
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      },
    },
  },
}

Plugin.opts_extend = { "sources.default" }

return Plugin
