-- luacheck: globals vim require("snacks")
local M = {}

M.keys = {
	-- Top Pickers & Explorer
	{
		"<leader>fb",
		function()
			require("snacks").picker.buffers()
		end,
		desc = "Buffers",
	},
	{
		"<leader>/",
		function()
			require("snacks").picker.grep()
		end,
		desc = "Grep",
	},
	{
		"<leader>:",
		function()
			require("snacks").picker.command_history()
		end,
		desc = "Command History",
	},
	{
		"<leader>n",
		function()
			require("snacks").picker.notifications()
		end,
		desc = "Notification History",
	},
	{
		"<leader>es",
		function()
			require("snacks").explorer()
		end,
		desc = "File Explorer",
	},
	-- find
	{
		"<leader>fb",
		function()
			require("snacks").picker.buffers()
		end,
		desc = "Find Buffers",
	},
	{
		"<leader>fc",
		function()
			require("snacks").picker.files({ cwd = vim.fn.stdpath("config") })
		end,
		desc = "Find Config File",
	},
	{
		"<leader>ff",
		function()
			require("snacks").picker.files()
		end,
		desc = "Find Files",
	},
	{
		"<leader>fg",
		function()
			require("snacks").picker.git_files()
		end,
		desc = "Find Git Files",
	},
	{
		"<leader>fp",
		function()
			require("snacks").picker.projects()
		end,
		desc = "Projects",
	},
	{
		"<leader>fr",
		function()
			require("snacks").picker.recent()
		end,
		desc = "Recent",
	},
	-- git
	{
		"<leader>gb",
		function()
			require("snacks").picker.git_branches()
		end,
		desc = "Git Branches",
	},
	{
		"<leader>gl",
		function()
			require("snacks").picker.git_log()
		end,
		desc = "Git Log",
	},
	{
		"<leader>gs",
		function()
			require("snacks").picker.git_status()
		end,
		desc = "Git Status",
	},
	{
		"<leader>gS",
		function()
			require("snacks").picker.git_stash()
		end,
		desc = "Git Stash",
	},
	{
		"<leader>gd",
		function()
			require("snacks").picker.git_diff()
		end,
		desc = "Git Diff (Hunks)",
	},
	{
		"<leader>gf",
		function()
			require("snacks").picker.git_log_file()
		end,
		desc = "Git Log File",
	},
	-- Grep
	{
		"<leader>sb",
		function()
			require("snacks").picker.lines()
		end,
		desc = "Buffer Lines",
	},
	{
		"<leader>sB",
		function()
			require("snacks").picker.grep_buffers()
		end,
		desc = "Grep Open Buffers",
	},
	{
		"<leader>sw",
		function()
			require("snacks").picker.grep_word()
		end,
		desc = "Visual selection or word",
		mode = { "n", "x" },
	},
	-- search
	{
		'<leader>s"',
		function()
			require("snacks").picker.registers()
		end,
		desc = "Registers",
	},
	{
		"<leader>s/",
		function()
			require("snacks").picker.search_history()
		end,
		desc = "Search History",
	},
	{
		"<leader>sa",
		function()
			require("snacks").picker.autocmds()
		end,
		desc = "Autocmds",
	},
	{
		"<leader>fC",
		function()
			require("snacks").picker.commands()
		end,
		desc = "Commands",
	},
	{
		"<leader>sd",
		function()
			require("snacks").picker.diagnostics()
		end,
		desc = "Diagnostics",
	},
	{
		"<leader>sD",
		function()
			require("snacks").picker.diagnostics_buffer()
		end,
		desc = "Buffer Diagnostics",
	},
	{
		"<leader>sh",
		function()
			require("snacks").picker.help()
		end,
		desc = "Help Pages",
	},
	{
		"<leader>sH",
		function()
			require("snacks").picker.highlights()
		end,
		desc = "Highlights",
	},
	{
		"<leader>si",
		function()
			require("snacks").picker.icons()
		end,
		desc = "Icons",
	},
	{
		"<leader>sj",
		function()
			require("snacks").picker.jumps()
		end,
		desc = "Jumps",
	},
	{
		"<leader>sk",
		function()
			require("snacks").picker.keymaps()
		end,
		desc = "Keymaps",
	},
	{
		"<leader>sm",
		function()
			require("snacks").picker.marks()
		end,
		desc = "Marks",
	},
	{
		"<leader>sM",
		function()
			require("snacks").picker.man()
		end,
		desc = "Man Pages",
	},
	{
		"<leader>sl",
		function()
			require("snacks").picker.lazy()
		end,
		desc = "Search for Plugin Spec",
	},
	{
		"<leader>su",
		function()
			require("snacks").picker.undo()
		end,
		desc = "Undo History",
	},
	{
		"<leader>uC",
		function()
			require("snacks").picker.colorschemes()
		end,
		desc = "Colorschemes",
	},
	-- Other
	{
		"<leader>z",
		function()
			require("snacks").zen()
		end,
		desc = "Toggle Zen Mode",
	},
	{
		"<leader>Z",
		function()
			require("snacks").zen.zoom()
		end,
		desc = "Toggle Zoom",
	},
	{
		"<leader>.",
		function()
			require("snacks").scratch()
		end,
		desc = "Toggle Scratch Buffer",
	},
	{
		"<leader>S",
		function()
			require("snacks").scratch.select()
		end,
		desc = "Select Scratch Buffer",
	},
	{
		"<leader>n",
		function()
			require("snacks").notifier.show_history()
		end,
		desc = "Notification History",
	},
	{
		"<leader>cR",
		function()
			require("snacks").rename.rename_file()
		end,
		desc = "Rename File",
	},
	{
		"<leader>gB",
		function()
			require("snacks").gitbrowse()
		end,
		desc = "Git Browse",
		mode = { "n", "v" },
	},
	{
		"<leader>gg",
		function()
			require("snacks").lazygit()
		end,
		desc = "Lazygit",
	},
	{
		"<c-/>",
		function()
			require("snacks").terminal()
		end,
		desc = "Toggle Terminal",
	},
	{
		"]]",
		function()
			require("snacks").words.jump(vim.v.count1)
		end,
		desc = "Next Reference",
		mode = { "n", "t" },
	},
	{
		"[[",
		function()
			require("snacks").words.jump(-vim.v.count1)
		end,
		desc = "Prev Reference",
		mode = { "n", "t" },
	},
	{
		"<leader>N",
		desc = "Neovim News",
		function()
			require("snacks").win({
				file = vim.api.nvim_get_runtime_file("doc/news.txt", false)[1],
				width = 0.6,
				height = 0.6,
				wo = {
					spell = false,
					wrap = false,
					signcolumn = "yes",
					statuscolumn = " ",
					conceallevel = 3,
				},
			})
		end,
	},
}

M.opts = {
	bigfile = { enabled = true },
	dashboard = { enabled = true },
	explorer = {
		enabled = true,
		auto_close = true,
		focus = "input",
		jump = {
			close = false,
		},
	},
	indent = { enabled = true },
	input = { enabled = true },
	notifier = {
		enabled = true,
		timeout = 3000,
	},
	picker = {
		enabled = true,
		matchers = {
			frecency = true,
			cwd_bonus = false,
		},
		sources = {
			explorer = {
				win = {
					list = {
						keys = {
							["<BS>"] = "explorer_up",
							["l"] = "confirm",
							["C"] = "explorer_close", -- close directory
							["a"] = "explorer_add",
							["d"] = "explorer_del",
							["r"] = "explorer_rename",
							["c"] = "explorer_copy",
							["m"] = "explorer_move",
							["o"] = "explorer_open", -- open with system application
							["P"] = "toggle_preview",
							["y"] = { "explorer_yank", mode = { "n", "x" } },
							["p"] = "explorer_paste",
							["u"] = "explorer_update",
							["<c-c>"] = "tcd",
							["<leader>/"] = "picker_grep",
							["<c-t>"] = "terminal",
							["."] = "explorer_focus",
							["i"] = "toggle_ignored",
							["h"] = "toggle_hidden",
							["Z"] = "explorer_close_all",
							["]g"] = "explorer_git_next",
							["[g"] = "explorer_git_prev",
							["]d"] = "explorer_diagnostic_next",
							["[d"] = "explorer_diagnostic_prev",
							["]w"] = "explorer_warn_next",
							["[w"] = "explorer_warn_prev",
							["]e"] = "explorer_error_next",
							["[e"] = "explorer_error_prev",
						},
					},
				},
			},
		},
	},
	quickfile = { enabled = true },
	scope = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	toggle = {
		enabled = true,
	},
	words = { enabled = true },
	styles = {
		notification = {
			-- wo = { wrap = true } -- Wrap notifications
		},
	},
}

return M
