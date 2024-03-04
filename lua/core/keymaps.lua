local key = vim.keymap

-- better up/down
-- key.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
-- key.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })

key.set("n", "<leader>w", "<cmd>write<CR>")
key.set("n", "<leader>q", "<cmd>quit<CR>")

-- Move Lines
key.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" })
key.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" })
key.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" })
key.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" })
key.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" })
key.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" })

-- Resize window using <ctrl> arrow keys
key.set("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" })
key.set("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" })
key.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" })
key.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" })

-- Switch buffers with <shift> hl
key.set("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev buffer" })
key.set("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next buffer" })

-- Clear search with <esc>
key.set({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and clear hlsearch" })

-- copy paste clipboard
key.set({ "n", "x" }, "<leader>y", '"+y')
key.set({ "n", "x" }, "<leader>v", '"+p')

-- Move to window using the <ctrl> hjkl keys
key.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
key.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
key.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
key.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- go to normal mode from terminal
key.set("t", "<esc>", "<c-\\><c-n>", { desc = "Enter Normal Mode" })

-- gradle
key.set("n", "<leader>gp", function()
	require("util.gradle-init").start()
end)

-- colorscheme
colormenu_path = vim.fn.expand("$HOME/.config/nvim/lua/util/colorscheme.lua")
key.set("n", "<leader>cs", function()
	vim.cmd("luafile " .. colormenu_path)
end)
