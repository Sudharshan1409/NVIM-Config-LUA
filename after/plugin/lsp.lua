local lsp = require("lsp-zero")
local lspconfig = require("lspconfig")

lsp.preset("recommended")

lsp.ensure_installed({
    'tsserver',
    'eslint',
    'pyright',
    'pylsp',
    'ruff_lsp',
    'lua_ls',
    'marksman',
    'vimls',
    'bashls',
    'dockerls',
    'jsonls',
    'html',
    'yamlls',
    'cssls',
    'graphql',
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()


local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-Space>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = true,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
    local opts = { buffer = bufnr, remap = false }

    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lsp.format_on_save({
    format_opts = {
        async = false,
        timeout_ms = 10000,
    },
    servers = {
        ['lua_ls'] = { 'lua' },
        ['rust_analyzer'] = { 'rust' },
        ['null-ls'] = { 'javascript', 'typescript', },
        ['yaml-language-server'] = { 'yaml', 'yml' },
        ['jsonls'] = { 'json' },
        ['html'] = { 'html' },
        ['cssls'] = { 'css' },
        ['graphql'] = { 'graphql' },
        ['pyright'] = { 'python' },
        ['pylsp'] = { 'python' },
    }
})

lsp.setup()

lspconfig.yamlls.setup {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yml", "yaml.docker-compose" },
    settings = {
        yaml = {
            schemas = {
                ['https://raw.githubusercontent.com/aws/serverless-application-model/main/samtranslator/schema/schema.json'] = "sam-schema.json",
                ['https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json'] = "cloudformation-schema.json",
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
            }
        }
    }
}

lspconfig.docker_compose_language_service.setup {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yml", "yaml.docker-compose" },
    settings = {
        yaml = {
            schemas = {
                ['https://raw.githubusercontent.com/aws/serverless-application-model/main/samtranslator/schema/schema.json'] = "sam-schema.json",
                ['https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json'] = "cloudformation-schema.json",
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
            }
        }
    }
}


vim.diagnostic.config({
    virtual_text = true
})
