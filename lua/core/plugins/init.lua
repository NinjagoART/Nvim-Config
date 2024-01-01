-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
local o = vim.o
if not vim.loop.fs_stat(lazypath) then
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


-- Plugins
require("lazy").setup({

	-- ==> Nerdtree
	{
		"nvim-tree/nvim-tree.lua",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
	},

	-- ==> Git stuff
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "│" },
				change = { text = "│" },
				delete = { text = "󰍵" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
				untracked = { text = "│" },
			},
			on_attach = function(bufnr)
				utils.load_mappings("gitsigns", { buffer = bufnr })
			end,

		},
		config = function()
			require("gitsigns").setup(opts)
		end,
	},

	-- ==> Completion Engines
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	{ 'hrsh7th/cmp-buffer' },
	{ 'hrsh7th/cmp-path' },
	{ 'hrsh7th/cmp-cmdline' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'hrsh7th/cmp-vsnip' },
	{ 'hrsh7th/vim-vsnip' },
	{ 'rafamadriz/friendly-snippets' },
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "L3MON4D3/LuaSnip" },
	{ "saadparwaiz1/cmp_luasnip" },
	{ "williamboman/mason.nvim" },
	{ "williamboman/mason-lspconfig.nvim" },
	{ "neovim/nvim-lspconfig" },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/cmp-nvim-lua' },

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},

	-- ==> Commenting
	{
		'numToStr/Comment.nvim',
		config = function()
			require("Comment").setup()
		end,
	},


	-- ==> Colorscheme	
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()

		end,
	},

	-- ==> Statusline
	{
		"MunifTanjim/nougat.nvim",
	},
	{
		"akinsho/bufferline.nvim",
	},
	-- ==> WhichKey
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			o.timeout = true
			o.timeoutlen = 300
		end,
		config = function()
			require("which-key").setup()
		end,
	},
	-- ==> Terminal
	{
		"NvChad/nvterm",
		config = function()
			require("nvterm").setup()
		end,
	},
	-- ==> Startup
	{
		'goolord/alpha-nvim',
		config = function()
			require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
		end
	},

	-- ==> Telescope
	{
		'nvim-telescope/telescope.nvim',
		tag = '0.1.5',
		-- or                              , branch = '0.1.x',
		dependencies = {
			'nvim-lua/plenary.nvim',
			"ahmedkhalf/project.nvim"
		}
	},


})

require("core.plugins.config")
