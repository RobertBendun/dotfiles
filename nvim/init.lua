require('packer-plugins')

local home_dir = vim.fn.expand("~")

-- Find cache directory
local cache_dir = os.getenv("XDG_CACHE_HOME")
if cache_dir == nil or cache_dir == "" then
	cache_dir = home_dir .. "/.cache"
end
cache_dir = cache_dir .. "/nvim/"

vim.g.mapleader = " "
vim.opt.number = true         -- Show current line number
vim.opt.relativenumber = true -- but for others show relative
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.hidden = true
vim.opt.incsearch = true
vim.opt.ignorecase = true -- Ignore case when searching
vim.opt.smartcase = true  -- unless there is uppercase letter in search
vim.opt.mouse = "n" -- Support mouse in normal mode

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = cache_dir .. "/undodir"
vim.opt.undofile = true

vim.cmd "colorscheme gruvbox"

-- Vertically center when entering insert mode
vim.api.nvim_create_autocmd({ "InsertEnter" }, { command = "norm zz" })

-- Trim tailing whitespace
vim.api.nvim_create_autocmd({ "BufWritePre" }, { callback = function()
	if not vim.o.binary and vim.o.filetype ~= "diff" then
		local current_view = vim.fn.winsaveview()
		vim.cmd([[keeppatterns %s/\s\+$//e]])
		vim.fn.winrestview(current_view)
	end
end})
