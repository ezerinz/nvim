local Plugin = { "saghen/blink.cmp" }

-- Plugin.lazy = true

Plugin.version = "*"
-- Plugin.build = "cargo build --release"

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
    default = { "lsp", "path", "snippets", "buffer", "lazydev", "luasnip" },
    cmdline = {},
    providers = {
      lazydev = {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100, -- show at a higher priority than lsp
      },
    },
  },
  completion = {
    menu = { border = "single" },
    list = {
      selection = "manual",
    },
    documentation = {
      auto_show = true,
      auto_show_delay_ms = 200,
      window = { border = "single" },
    },
    ghost_text = {
      enabled = true,
    },
  },
  signature = { window = { border = "single" } },
}

Plugin.opts_extend = { "sources.default" }

return Plugin
