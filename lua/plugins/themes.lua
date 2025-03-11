-- luacheck: globals vim
return {
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
	{
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
	},
}
