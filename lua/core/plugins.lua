-- This file can be loaded by calling `lua require("plugins")` from your init.vim
-- Only required if you have packer configured as `opt`
-- Packer can manage itself
local utils = require("core.utils")
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
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
local plugins = {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
	},
	"nvim-treesitter/playground",
	"nvim-lua/plenary.nvim",
	{
		"mfussenegger/nvim-lint",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
	},
	"theprimeagen/harpoon",
	"mbbill/undotree",
	"tpope/vim-fugitive",
	"airblade/vim-rooter",
	{
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
	},

	{
		{
			"VonHeikemen/lsp-zero.nvim",
			branch = "v3.x",
			lazy = true,
			config = false,
			init = function()
				-- Disable automatic setup, we are doing it manually
				vim.g.lsp_zero_extend_cmp = 0
				vim.g.lsp_zero_extend_lspconfig = 0
			end,
		},
		{
			"williamboman/mason.nvim",
			dependencies = {
				"WhoIsSethDaniel/mason-tool-installer.nvim",
			},
			lazy = false,
			config = function()
				local mason = require("mason")
				mason.setup({
					ui = {
						icons = {
							package_installed = "✓",
							package_pending = "➜",
							package_uninstalled = "✗",
						},
					},
				})
				utils.mason_tools_config_function()
			end,
		},

		-- Autocompletion
		{
			"hrsh7th/nvim-cmp",
			event = "InsertEnter",
			dependencies = {
				{ "L3MON4D3/LuaSnip" },
			},
			config = utils.cmp_config_function,
		},

		-- LSP
		{
			"neovim/nvim-lspconfig",
			cmd = { "LspInfo", "LspInstall", "LspStart" },
			event = { "BufReadPre", "BufNewFile" },
			dependencies = {
				{ "hrsh7th/cmp-nvim-lsp" },
				{ "williamboman/mason-lspconfig.nvim" },
			},
			config = utils.lsp_config_function,
		},
	},

	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},
	"ThePrimeagen/vim-with-me",
	"ThePrimeagen/vim-be-good",
	"eandrju/cellular-automaton.nvim",
	{ "mg979/vim-visual-multi", branch = "master" },
	"andymass/vim-matchup",
	"godlygeek/tabular",
	"preservim/vim-markdown",
	"akinsho/toggleterm.nvim",
	"ericbn/vim-relativize",
	"LaurenceWarne/cfn-lsp-extra",
	"chase/vim-ansible-yaml",
	"ggandor/lightspeed.nvim",
	{
		"numToStr/Comment.nvim",
		opts = {
			-- add any options here
		},
	},
	"ryanoasis/vim-devicons",

	-- themes
	"ellisonleao/gruvbox.nvim",
	{
		"rose-pine/neovim",
		as = "rose-pine",
	},
	"shaunsingh/nord.nvim",
	"navarasu/onedark.nvim",
	"Mofiqul/dracula.nvim",
	"tanvirtin/monokai.nvim",
	"mhartington/oceanic-next",

	-- These optional plugins should be loaded directly because of a bug in Packer lazy loading
	"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
	"lewis6991/gitsigns.nvim",
	"romgrk/barbar.nvim", -- OPTIONAL: for buffer tabline

	"christoomey/vim-tmux-navigator",
	"petertriho/nvim-scrollbar",
	"zyedidia/vim-snake",
	"levouh/tint.nvim",
	"sharkdp/fd",
	{
		"linux-cultist/venv-selector.nvim",
		dependencies = {
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			"mfussenegger/nvim-dap-python", --optional
			{ "nvim-telescope/telescope.nvim", branch = "0.1.x", dependencies = { "nvim-lua/plenary.nvim" } },
		},
		lazy = false,
		branch = "regexp", -- This is the regexp branch, use this for the new version
		config = function()
			require("venv-selector").setup()
		end,
		keys = {
			{ ",v", "<cmd>VenvSelect<cr>" },
		},
	},
	{
		"stevearc/oil.nvim",
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	{
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons", opt = true },
	},
	{
		"windwp/nvim-autopairs",
	},
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},
	{
		"HiPhish/nvim-ts-rainbow2",
	},
	"alvan/vim-closetag",
	"ThePrimeagen/git-worktree.nvim",
	{
		"anuvyklack/pretty-fold.nvim",
		config = function()
			require("pretty-fold").setup()
		end,
	},
	{
		"utilyre/barbecue.nvim",
		name = "barbecue",
		version = "*",
		dependencies = {
			"SmiteshP/nvim-navic",
			"nvim-tree/nvim-web-devicons", -- optional dependency
		},
		opts = {
			-- configurations go here
		},
	},
	{
		"Wansmer/treesj",
		keys = { "<leader>m", "<CMD>TSJToggle<CR>", desc = "Toggle treesitter highlight" },
		cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
		dependencies = { "nvim-treesitter/nvim-treesitter" },
		opts = { use_default_keybindings = false },
		config = function()
			require("treesj").setup({
				max_join_length = 5000,
			})
		end,
	},
	{
		"simrat39/symbols-outline.nvim",
		config = function()
			require("symbols-outline").setup(utils.symbols_opts)
		end,
	},
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
	{
		"nvim-treesitter/nvim-treesitter-textobjects",
		dependencies = { "nvim-treesitter/nvim-treesitter" },
	},
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
		-- install jsregexp (optional!).
		dependencies = {
			"rafamadriz/friendly-snippets",
			"saadparwaiz1/cmp_luasnip",
		},
		build = "make install_jsregexp",
	},
	-- lazy.nvim
	{
		{ "codota/tabnine-nvim", build = "./dl_binaries.sh" },
	},
	{ "kosayoda/nvim-lightbulb" },
	{
		"f-person/git-blame.nvim",
		-- load the plugin at startup
		event = "VeryLazy",
		-- Because of the keys part, you will be lazy loading this plugin.
		-- The plugin wil only load once one of the keys is used.
		-- If you want to load the plugin at startup, add something like event = "VeryLazy",
		-- or lazy = false. One of both options will work.
		opts = {
			-- your configuration comes here
			-- for example
			enabled = true, -- if you want to enable the plugin
			message_template = " <summary> • <date> • <author> • <<sha>>", -- template for the blame message, check the Message template section for more options
			date_format = "%d-%m-%Y %H:%M:%S", -- template for the date, check Date format section for more options
			virtual_text_column = 1, -- virtual text start column, check Start virtual text at column section for more options
			message_when_not_committed = "Bruh!! Please commit this",
			highlight_group = "Comment",
			use_blame_commit_file_urls = true,
		},
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
