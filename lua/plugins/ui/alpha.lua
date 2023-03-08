-- startup screen 
return {
	"goolord/alpha-nvim",
	event = "VimEnter",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.dashboard")
		local logo = {
			"           ⣀⣀⣀⣀           ",
			"     ⢀⣤⣶⠿⠛⠛⠉⠉⠉⠉⠛⠻⢿⣶⣤      ",
			"⠀⠀ ⣠⣾⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⣷⣄   ",
			"⠀ ⣾⠟⠀⠀⠀⢀⣴⠒⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⣶  ",
			" ⣿⠋⠀⠀⠀⢰⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⣷ ",
			"⣸⡿⠀⠀⠀⠀⠈⢿⣿⣿⣾⣿⣿⣷⣤⣀⠀⠀⠀⠀⠈⣄⠀⠀⢿⣆",
			"⣿⡇⠀⠀⠀⠀⠀⠠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣶⣀⢀⣠⣿⠀⠀⢸⣿",
			"⢹⣷⣀⣀⣀⣤⣴⣶⣿⣿⣷⣙⣻⣿⣿⡿⢋⣿⣿⡿⠟⠁⠀⠀⣾⡏",
			"⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠛⠻⠻⠂⠀⠀⢰⣿ ",
			" ⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠬⠉⠙⣿⡟⠀⠀⠀⠀⠀⣴⡿  ",
			"   ⠛⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣿⣿⠀⠀⠀⢀⣴⣿⠋   ",
			"⠀⠀⠀⠀⠀⠉⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⣴⣾⠛⠉     ",
			"  ⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠉⠈          ",
		}
		dashboard.section.header.val = logo
		dashboard.section.header.opts.hl = "Error"

		local stats = require("lazy").stats()
		local heading = {
			type = "text",
			val = "Neovim loaded " .. stats.count .. " plugins ",
			opts = {
				position = "center",
				hl = "Error",
			},
		}

		local function getGreeting(name)
			local tableTime = os.date("*t")
			local hour = tableTime.hour
			local greetingsTable = {
				[1] = "  Sleep well",
				[2] = "  Good morning",
				[3] = "  Good afternoon",
				[4] = "  Good evening",
				[5] = "望 Good night",
			}
			barkiri = "──── "
			barkanan = " ────"
			local greetingIndex = 0
			if hour == 23 or hour < 7 then
				greetingIndex = 1
				barkiri = "───── "
				barkanan = " ─────"
			elseif hour < 12 then
				greetingIndex = 2
			elseif hour >= 12 and hour < 18 then
				greetingIndex = 3
				barkiri = "─── "
				barkanan = " ───"
			elseif hour >= 18 and hour < 21 then
				greetingIndex = 4
			elseif hour >= 21 then
				greetingIndex = 5
				barkiri = "───── "
				barkanan = " ─────"
			end

			return barkiri .. greetingsTable[greetingIndex] .. ", " .. name .. barkanan
		end

		local userName = "Ezerinz"
		local greeting = "┌─" .. getGreeting(userName) .. "─┐"

		local greetHeading = {
			type = "text",
			val = greeting,
			opts = {
				position = "center",
				hl = "Error",
			},
		}

		local function button(sc, txt, keybind, keybind_opts)
			local b = dashboard.button(sc, txt, keybind, keybind_opts)
			b.opts.hl = "Comment"
			b.opts.hl_shortcut = "Error"
			return b
		end

		colormenu_path = vim.fn.expand("$HOME/.config/nvim/lua/util/colorscheme.lua")

		dashboard.section.buttons.val = {
			button("t", " " .. " File Explorer", "<cmd>ene <BAR> Neotree toggle<CR>"),
			button("f", " " .. " Find File", ":Telescope find_files <CR>"),
			button("r", " " .. " Recent Files", ":Telescope oldfiles <CR>"),
			button("g", " " .. " Find Text", ":Telescope live_grep <CR>"),
			button("c", "🖌" .. " Change Colorscheme", ":luafile " .. colormenu_path .. "<CR>"),
			button("l", "鈴" .. " Lazy", ":Lazy<CR>"),
			button("q", " " .. " Quit", ":qa<CR>"),
		}
		dashboard.section.buttons.opts.spacing = 0

		local function footer()
			local datetime = os.date(" %d/%m/%Y ")
			local version = vim.version()
			local nvim_version_info = "  v" .. version.major .. "." .. version.minor .. "." .. version.patch

			return {
				type = "text",
				val = "──────────── "
					.. datetime
					.. "|"
					.. nvim_version_info
					.. " ─────────────",
				opts = {
					position = "center",
					hl = "Comment",
				},
			}
		end

		local quote = "First, solve the problem. Then, write the code."
		local quoteAuthor = "John Johnson"

		local fortune = {
			type = "text",
			val = quote,
			opts = {
				position = "center",
				hl = "Comment",
			},
		}

		local fortune1 = {
			type = "text",
			val = "                                -" .. quoteAuthor,
			opts = {
				position = "center",
				hl = "Comment",
			},
		}

		local opts = {
			layout = {
				dashboard.section.header,
				greetHeading,
				heading,
				{ type = "padding", val = 2 },
				dashboard.section.buttons,
				footer(),
				{ type = "padding", val = 2 },
				fortune,
				{ type = "padding", val = 1 },
				fortune1,
			},
			opts = {
				margin = 45,
			},
		}
		alpha.setup(opts)
		vim.cmd([[ autocmd FileType alpha setlocal nofoldenable]])
		vim.api.nvim_create_autocmd("User", {
			pattern = "LazyVimStarted",
			callback = function()
				local stats = require("lazy").stats()
				local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
				ms = string.format("%.2f", ms)
				heading.val =
					"└──  " .. stats.count .. " plugins loaded in " .. ms .. "ms ──┘",
					pcall(vim.cmd.AlphaRedraw)
			end,
		})
	end,
}
