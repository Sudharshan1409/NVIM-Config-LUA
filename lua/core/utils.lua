-- luacheck: globals vim
local function addDesc(tbl, desc)
	local merged = {} -- Create a new table to hold the merged result
	for k, v in pairs(tbl) do
		merged[k] = v -- Copy elements from tbl1 to the merged table
	end
	merged.desc = desc
	return merged -- Return the merged table
end

local pylsp_setup = {
	settings = {
		pylsp = {
			plugins = {
				-- formatter options
				black = { enabled = true },
				autopep8 = { enabled = true },
				yapf = { enabled = false },
				-- linter options
				-- pylint = { enabled = true, executable = "pylint" },
				pyflakes = { enabled = false },
				pycodestyle = {
					enabled = true,
					ignore = { "W391" },
					maxLineLength = 120,
				},
				-- type checker
				pylsp_mypy = { enabled = true },
				-- auto-completion options
				jedi_completion = { fuzzy = true },
				-- import sorting
				pyls_isort = { enabled = true },
			},
		},
	},
}

local yamlls_setup = {
	cmd = { "yaml-language-server", "--stdio" },
	filetypes = { "yaml", "yml", "yaml.docker-compose" },
	settings = {
		yaml = {
			schemas = {
				["https://raw.githubusercontent.com/aws/serverless-application-model/main/samtranslator/schema/schema.json"] = "sam-schema.json",
				["https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json"] = "cloudformation-schema.json",
			},
			customTags = {
				"!And scalar",
				"!And sequence",
				"!And mapping",
				"!If scalar",
				"!If sequence",
				"!If mapping",
				"!Not scalar",
				"!Not sequence",
				"!Not mapping",
				"!Equals scalar",
				"!Equals sequence",
				"!Equals mapping",
				"!Or scalar",
				"!Or sequence",
				"!Or mapping",
				"!FindInMap scalar",
				"!FindInMap sequence",
				"!FindInMap mapping",
				"!Base64 scalar",
				"!Base64 sequence",
				"!Base64 mapping",
				"!Cidr scalar",
				"!Cidr sequence",
				"!Cidr mapping",
				"!Ref scalar",
				"!Ref sequence",
				"!Ref mapping",
				"!Sub scalar",
				"!Sub sequence",
				"!Sub mapping",
				"!GetAtt scalar",
				"!GetAtt sequence",
				"!GetAtt mapping",
				"!GetAZs scalar",
				"!GetAZs sequence",
				"!GetAZs mapping",
				"!ImportValue scalar",
				"!ImportValue sequence",
				"!ImportValue mapping",
				"!Select scalar",
				"!Select sequence",
				"!Select mapping",
				"!Split scalar",
				"!Split sequence",
				"!Split mapping",
				"!Join scalar",
				"!Join sequence",
				"!Join mapping",
				"!ImportValue scalar",
				"!ImportValue sequence",
				"!ImportValue mapping",
				"!Select scalar",
				"!Select sequence",
				"!Select mapping",
				"!Split scalar",
				"!Split sequence",
				"!Split mapping",
				"!Join scalar",
				"!Join sequence",
				"!Join mapping",
				"!ImportValue scalar",
				"!ImportValue sequence",
				"!ImportValue mapping",
				"!Select scalar",
				"!Select sequence",
				"!Select mapping",
				"!Split scalar",
				"!Split sequence",
				"!Split mapping",
				"!Join scalar",
				"!Join sequence",
				"!Join mapping",
				"!ImportValue scalar",
				"!ImportValue sequence",
				"!ImportValue mapping",
				"!Select scalar",
				"!Select sequence",
				"!Select mapping",
				"!Split scalar",
				"!Split sequence",
				"!Split mapping",
				"!Join scalar",
				"!Join sequence",
				"!Join mapping",
				"!ImportValue scalar",
				"!ImportValue sequence",
				"!ImportValue mapping",
				"!Select scalar",
				"!Select sequence",
				"!Select mapping",
				"!Split scalar",
				"!Split sequence",
			},
		},
	},
}

local symbols_opts = {
	highlight_hovered_item = true,
	show_guides = true,
	auto_preview = false,
	position = "right",
	relative_width = true,
	width = 25,
	auto_close = false,
	show_numbers = false,
	show_relative_numbers = false,
	show_symbol_details = true,
	preview_bg_highlight = "Pmenu",
	autofold_depth = nil,
	auto_unfold_hover = true,
	fold_markers = { "", "" },
	wrap = false,
	keymaps = { -- These keymaps can be a string or a table for multiple keys
		close = { "<Esc>", "q" },
		goto_location = "<Cr>",
		focus_location = "o",
		hover_symbol = "<C-space>",
		toggle_preview = "K",
		rename_symbol = "r",
		code_actions = "a",
		fold = "h",
		unfold = "l",
		fold_all = "W",
		unfold_all = "E",
		fold_reset = "R",
	},
	lsp_blacklist = {},
	symbol_blacklist = {},
	symbols = {
		File = { icon = "", hl = "@text.uri" },
		Module = { icon = "", hl = "@namespace" },
		Namespace = { icon = "", hl = "@namespace" },
		Package = { icon = "", hl = "@namespace" },
		Class = { icon = "𝓒", hl = "@type" },
		Method = { icon = "ƒ", hl = "@method" },
		Property = { icon = "", hl = "@method" },
		Field = { icon = "", hl = "@field" },
		Constructor = { icon = "", hl = "@constructor" },
		Enum = { icon = "ℰ", hl = "@type" },
		Interface = { icon = "ﰮ", hl = "@type" },
		Function = { icon = "", hl = "@function" },
		Variable = { icon = "", hl = "@constant" },
		Constant = { icon = "", hl = "@constant" },
		String = { icon = "𝓐", hl = "@string" },
		Number = { icon = "#", hl = "@number" },
		Boolean = { icon = "⊨", hl = "@boolean" },
		Array = { icon = "", hl = "@constant" },
		Object = { icon = "⦿", hl = "@type" },
		Key = { icon = "🔐", hl = "@type" },
		Null = { icon = "NULL", hl = "@type" },
		EnumMember = { icon = "", hl = "@field" },
		Struct = { icon = "𝓢", hl = "@type" },
		Event = { icon = "🗲", hl = "@type" },
		Operator = { icon = "+", hl = "@operator" },
		TypeParameter = { icon = "𝙏", hl = "@parameter" },
		Component = { icon = "", hl = "@function" },
		Fragment = { icon = "", hl = "@constant" },
	},
}

local mason_tools_ensure_installed = {
	"prettier",
	"stylua",
	"isort",
	"black",
	"ruff",
	"eslint_d",
	"markdownlint",
	"luacheck",
	"jsonlint",
	"shellcheck",
	"yamllint",
}

local lspconfig_ensure_installed = {
	"ts_ls",
	"eslint",
	"pylsp",
	"lua_ls",
	"marksman",
	"vimls",
	"bashls",
	"dockerls",
	"jsonls",
	"html",
	"yamlls",
	"cssls",
	"graphql",
}

function ToggleLineWrap()
	if vim.wo.wrap then
		vim.wo.wrap = false
	else
		vim.wo.wrap = true
	end
end

return {
	yamlls_setup = yamlls_setup,
	lspconfig_ensure_installed = lspconfig_ensure_installed,
	mason_tools_ensure_installed = mason_tools_ensure_installed,
	symbols_opts = symbols_opts,
	addDesc = addDesc,
	pylsp_setup = pylsp_setup,
}
