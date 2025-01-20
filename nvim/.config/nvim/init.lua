vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins")
require("keybinds").setup()

if vim.g.neovide then
	require("neovide").setup()
else
	-- Set transparent background for terminal
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
end

vim.opt.termguicolors = true
vim.opt.incsearch = true
vim.opt.hlsearch = true
vim.opt.relativenumber = true
vim.opt.number = true
vim.opt.background = "dark"
vim.opt.ruler = true
vim.opt.showmatch = true
vim.opt.foldmethod = "syntax"
vim.opt.foldnestmax = 1
vim.opt.foldlevel = 1
vim.opt.expandtab = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.formatoptions = "jcroql"

vim.api.nvim_create_autocmd("FileType", {
	pattern = "python",
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.softtabstop = 4
	end,
})
