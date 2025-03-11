-- luacheck: globals vim
local utils = require("core.utils")

return {
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

			local mason_tool_installer = require("mason-tool-installer")

			mason_tool_installer.setup({
				ensure_installed = utils.mason_tools_ensure_installed,
			})
		end,
	},

	-- Autocompletion
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			{ "L3MON4D3/LuaSnip" },
		},
		config = function()
			-- Here is where you configure the autocompletion settings.
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_cmp()

			-- And you can configure cmp even more, if you want to.
			local cmp = require("cmp")
			local cmp_action = lsp_zero.cmp_action()

			cmp.setup({
				sources = {
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				},
				mapping = {
					["<C-y>"] = cmp.mapping.confirm({ select = false }),
					["<C-e>"] = cmp.mapping.abort(),
					["<Up>"] = cmp.mapping.select_prev_item({ behavior = "select" }),
					["<Down>"] = cmp.mapping.select_next_item({ behavior = "select" }),
					["<C-p>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_prev_item({ behavior = "insert" })
						else
							cmp.complete()
						end
					end),
					["<C-n>"] = cmp.mapping(function()
						if cmp.visible() then
							cmp.select_next_item({ behavior = "insert" })
						else
							cmp.complete()
						end
					end),
				},
				snippet = {
					expand = function(args)
						require("luasnip").lsp_expand(args.body)
					end,
				},
			})
		end,
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
		config = function()
			-- This is where all the LSP shenanigans will live
			local lsp_zero = require("lsp-zero")
			lsp_zero.extend_lspconfig()
			lsp_zero.set_preferences({
				suggest_lsp_servers = true,
			})

			local sign_icons = {
				error = "✘",
				warn = "▲",
				hint = "⚑",
				info = "»",
			}
			lsp_zero.set_sign_icons(sign_icons)

			lsp_zero.on_attach(function(client, bufnr)
				-- see :help lsp-zero-keybindings
				-- to learn the available actions

				local opts = { buffer = bufnr, remap = false }
				local keymap = vim.keymap.set

				keymap("n", "gd", function()
					vim.lsp.buf.definition()
				end, utils.addDesc(opts, "LSP: Go to definition"))
				keymap("n", "K", function()
					vim.lsp.buf.hover()
				end, utils.addDesc(opts, "LSP: Show hover"))
				keymap("n", "<leader>skw", function()
					vim.lsp.buf.workspace_symbol()
				end, utils.addDesc(opts, "LSP: Search workspace symbols"))
				keymap("n", "gl", function()
					vim.diagnostic.open_float()
				end, utils.addDesc(opts, "LSP: Open error in float"))
				keymap("n", "[", function()
					vim.diagnostic.goto_prev()
				end, utils.addDesc(opts, "LSP: Go to previous error"))
				keymap("n", "]", function()
					vim.diagnostic.goto_next()
				end, utils.addDesc(opts, "LSP: Go to next error"))
				keymap("n", "<leader>ca", function()
					vim.lsp.buf.code_action()
				end, utils.addDesc(opts, "LSP: Code action"))
				keymap("n", "<leader>gr", function()
					vim.lsp.buf.references()
				end, utils.addDesc(opts, "LSP: Find references"))
				keymap("n", "<leader>rn", function()
					vim.lsp.buf.rename()
				end, utils.addDesc(opts, "LSP: Rename symbol"))
				keymap("i", "<C-h>", function()
					vim.lsp.buf.signature_help()
				end, utils.addDesc(opts, "LSP: Signature help"))
				lsp_zero.default_keymaps({ buffer = bufnr })
			end)

			require("mason-lspconfig").setup({
				ensure_installed = utils.lspconfig_ensure_installed,
				handlers = {
					lsp_zero.default_setup,
					lua_ls = function()
						-- (Optional) Configure lua language server for neovim
						local lua_opts = lsp_zero.nvim_lua_ls()
						require("lspconfig").lua_ls.setup(lua_opts)
						require("lspconfig").yamlls.setup(utils.yamlls_setup)
						require("lspconfig").pylsp.setup(utils.pylsp_setup)
					end,
				},
			})
			lsp_zero.setup()
			vim.diagnostic.config({
				virtual_text = true,
			})
		end,
	},
}
