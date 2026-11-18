vim.g.mapleader = " "

local v = vim.opt
local map = vim.keymap.set

v.number = true
v.relativenumber = true
v.termguicolors = true
v.clipboard = "unnamedplus"
v.cmdheight = 0
v.swapfile = false
v.tabstop = 2

vim.pack.add({
	"https://github.com/rose-pine/neovim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/windwp/nvim-autopairs",
	"https://github.com/ibhagwan/fzf-lua",
	{
		src = "https://github.com/saghen/blink.cmp",
		branch = "v1",
	}
})

require("rose-pine").setup({
	styles = {
		italic = false,
	}
})

vim.cmd.colorscheme("rose-pine")

vim.lsp.enable({
	"lua_ls",
	"rust_analyzer",
	"dartls",
})

require("nvim-autopairs").setup()
require("blink.cmp").setup()

require("fzf-lua").setup({
	actions = {
		files = {

			["ctrl-s"] = FzfLua.actions.file_split,
			["ctrl-v"] = FzfLua.actions.file_vsplit,
			["enter"]  = FzfLua.actions.file_tabedit,
		}
	}
})

local fzf = require("fzf-lua")

map("n", "<leader>m", vim.lsp.buf.format)
map("n", "<leader>e", vim.diagnostic.open_float)
map("n", "<leader>ca", vim.lsp.buf.code_action)

map("n", "<leader>f", fzf.files)
map("n", "<leader>b", fzf.buffers)
map("n", "<leader>g", fzf.live_grep)
