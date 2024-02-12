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
	{ 'f3fora/cmp-spell' },
	{
		"windwp/nvim-autopairs",
		opts = {
			fast_wrap = {},
			disable_filetype = { "telescopeprompt", "vim" },
		},
		config = function(_, opts)
			require("nvim-autopairs").setup(opts)

			-- setup cmp for autopairs
			local cmp_autopairs = require "nvim-autopairs.completion.cmp"
			require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
		end,
	},
	{
		{
			"williamboman/mason.nvim",
			lazy = false,
			config = function()
				require("mason").setup()
			end,
		},
		{
			"williamboman/mason-lspconfig.nvim",
			lazy = false,
		},

		{
			"neovim/nvim-lspconfig",
		},
		{
			"stevearc/conform.nvim",
			optional = true,
			opts = {
				formatters_by_ft = {
					cs = { "csharpier" },
				},
				formatters = {
					csharpier = {
						command = "dotnet-csharpier",
						args = { "--write-stdout" },
					},
				},
			},
		},
		{
			"nvimtools/none-ls.nvim",
		},
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	-- ==> Commenting
	{
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	},

	-- ==> Colorscheme
	{
		"ellisonleao/gruvbox.nvim",
		priority = 1000,
		config = function()
			vim.o.background = "dark"
			vim.cmd([[colorscheme gruvbox]])
		end,
	},

	-- {
	-- 	'luisiacc/gruvbox-baby',
	-- 	priority = 1000,
	-- },

	-- ==> Statusline
	-- {
	-- 	"MunifTanjim/nougat.nvim",
	-- },
	{
		"nvim-lualine/lualine.nvim",
		config = function()
			require("lualine").setup({
				options = {
					theme = "gruvbox",
				},
			})
		end,
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
		"goolord/alpha-nvim",
		config = function()
			require("alpha").setup(require("alpha.themes.dashboard").config)
		end,
	},

	-- ==> Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.5",
		-- or                              , branch = '0.1.x',
		dependencies = {
			"nvim-lua/plenary.nvim",
			"ahmedkhalf/project.nvim",
		},
	},
	-- ==> C# development
	{ {
		"OmniSharp/omnisharp-vim",
	}, {
		"Hoffs/omnisharp-extended-lsp.nvim",
		lazy = false,
	} },

	-- ==> Color highlighter
	{
		'norcalli/nvim-colorizer.lua',
		config = function()
			require("colorizer").setup()
		end,
	},


	-- {
	-- 	'Decodetalkers/csharpls-extended-lsp.nvim'
	--
	-- },
	{
		'f3fora/nvim-texlabconfig',
		config = function()
			require('texlabconfig').setup()
		end,
		ft = { 'tex', 'bib' }, -- Lazy-load on filetype
		build = 'go build'
		-- build = 'go build -o ~/.bin/' if e.g. ~/.bin/ is in $PATH
	},
	{
		"zbirenbaum/copilot.lua",
		event = { "InsertEnter" },
		cmd = { "Copilot" },
		opts = {
			suggestion = {
				auto_trigger = true,
				keymap = {
					accept = "<C-CR>",
					accept_word = false,
					accept_line = false,
					next = "<M-]>",
					prev = "<M-[>",
					dismiss = "<C-]>",
				},
			},
		}
	},
	{
		"zbirenbaum/copilot-cmp",
		config = function()
			require("copilot_cmp").setup()
		end
	},

	{ 
		'codota/tabnine-nvim', 
		build = "./dl_binaries.sh" 
	},

})

require("core.plugins.config")
