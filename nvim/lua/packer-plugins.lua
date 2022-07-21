return require('packer').startup(function()
	-- packer can manage itself
	use 'wbthomason/packer.nvim'

	-- colorscheme
	use 'gruvbox-community/gruvbox'

	-- Language Server
	use 'neovim/nvim-lspconfig'

	-- Snippets
	use "L3MON4D3/LuaSnip"

	-- Completion
	use "hrsh7th/nvim-cmp"
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-nvim-lua"
	use "hrsh7th/cmp-nvim-lsp"

	-- Distraction free mode
	-- use "junegunn/limelight.vim" -- dont work with gruvbox, don't care why yet
	use "junegunn/goyo.vim"
end)
