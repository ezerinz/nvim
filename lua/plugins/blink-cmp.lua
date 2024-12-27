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
      selection = function(ctx)
        return ctx.mode == "cmdline" and "auto_insert" or "manual"
      end,
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
    expand = function(snippet)
      require("luasnip").lsp_expand(snippet)
    end,
    active = function(filter)
      if filter and filter.direction then
        return require("luasnip").jumpable(filter.direction)
      end
      return require("luasnip").in_snippet()
    end,
    jump = function(direction)
      require("luasnip").jump(direction)
    end,
  },
  sources = {
    default = { "lsp", "path", "luasnip", "buffer", "lazydev" },
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
