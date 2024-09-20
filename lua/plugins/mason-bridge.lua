local Plugin = { "frostplexx/mason-bridge.nvim" }

Plugin.event = { "BufRead", "InsertEnter" }

Plugin.priority = 100

Plugin.config = true

return Plugin
