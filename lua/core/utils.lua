local function addDesc(tbl, desc)
    local merged = {} -- Create a new table to hold the merged result
    for k, v in pairs(tbl) do
        merged[k] = v -- Copy elements from tbl1 to the merged table
    end
    merged.desc = desc
    return merged -- Return the merged table
end

local yamlls_setup = {
    cmd = { "yaml-language-server", "--stdio" },
    filetypes = { "yaml", "yml", "yaml.docker-compose" },
    settings = {
        yaml = {
            schemas = {
                ['https://raw.githubusercontent.com/aws/serverless-application-model/main/samtranslator/schema/schema.json'] =
                "sam-schema.json",
                ['https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json'] =
                "cloudformation-schema.json",
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

local ensure_installed = {
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
    'autopep8',
}

local cmp_config_function = function()
    -- Here is where you configure the autocompletion settings.
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_cmp()

    -- And you can configure cmp even more, if you want to.
    local cmp = require('cmp')
    local cmp_action = lsp_zero.cmp_action()

    cmp.setup({
        sources = {
            { name = 'nvim_lsp' },
        },
        mapping = {
            ['<C-y>'] = cmp.mapping.confirm({ select = false }),
            ['<C-e>'] = cmp.mapping.abort(),
            ['<Up>'] = cmp.mapping.select_prev_item({ behavior = 'select' }),
            ['<Down>'] = cmp.mapping.select_next_item({ behavior = 'select' }),
            ['<C-p>'] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_prev_item({ behavior = 'insert' })
                else
                    cmp.complete()
                end
            end),
            ['<C-n>'] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_next_item({ behavior = 'insert' })
                else
                    cmp.complete()
                end
            end),
        },
        snippet = {
            expand = function(args)
                require('luasnip').lsp_expand(args.body)
            end,
        },
    })
end

local lsp_config_function = function()
    -- This is where all the LSP shenanigans will live
    local lsp_zero = require('lsp-zero')
    lsp_zero.extend_lspconfig()
    lsp_zero.set_preferences({
        suggest_lsp_servers = true,
    })

    local sign_icons = {
        error = '✘',
        warn = '▲',
        hint = '⚑',
        info = '»'
    }
    lsp_zero.set_sign_icons(sign_icons)

    lsp_zero.format_on_save({
        format_opts = {
            async = false,
            timeout_ms = 10000,
        },
        servers = {
            ['lua_ls'] = { 'lua' },
            ['rust_analyzer'] = { 'rust' },
            ['tsserver'] = { 'typescript' },
            ['null-ls'] = { 'javascript', 'typescript', },
            ['yaml-language-server'] = { 'yaml', 'yml' },
            ['jsonls'] = { 'json' },
            ['html'] = { 'html' },
            ['cssls'] = { 'css' },
            ['graphql'] = { 'graphql' },
            ['pyright'] = { 'python' },
            ['vimls'] = { 'vim' },
            ['dockerls'] = { 'dockerfile' },
            ['bashls'] = { 'bash' },
            ['pylsp'] = { 'python' },
        }
    })

    lsp_zero.on_attach(function(client, bufnr)
        -- see :help lsp-zero-keybindings
        -- to learn the available actions

        local opts = { buffer = bufnr, remap = false }
        local keymap = vim.keymap.set

        keymap("n", "gd", function() vim.lsp.buf.definition() end, addDesc(opts, "LSP: Go to definition"))
        keymap("n", "K", function() vim.lsp.buf.hover() end, addDesc(opts, "LSP: Show hover"))
        keymap("n", "<leader>skw", function() vim.lsp.buf.workspace_symbol() end,
            addDesc(opts, "LSP: Search workspace symbols"))
        keymap("n", "gl", function() vim.diagnostic.open_float() end, addDesc(opts, "LSP: Open error in float"))
        keymap("n", "[", function() vim.diagnostic.goto_prev() end, addDesc(opts, "LSP: Go to previous error"))
        keymap("n", "]", function() vim.diagnostic.goto_next() end, addDesc(opts, "LSP: Go to next error"))
        keymap("n", "<leader>ca", function() vim.lsp.buf.code_action() end, addDesc(opts, "LSP: Code action"))
        keymap("n", "<leader>gr", function() vim.lsp.buf.references() end, addDesc(opts, "LSP: Find references"))
        keymap("n", "<leader>rn", function() vim.lsp.buf.rename() end, addDesc(opts, "LSP: Rename symbol"))
        keymap("i", "<C-h>", function() vim.lsp.buf.signature_help() end, addDesc(opts, "LSP: Signature help"))
        lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    require('mason-lspconfig').setup({
        ensure_installed = ensure_installed,
        handlers = {
            lsp_zero.default_setup,
            lua_ls = function()
                -- (Optional) Configure lua language server for neovim
                local lua_opts = lsp_zero.nvim_lua_ls()
                require('lspconfig').lua_ls.setup(lua_opts)
                require('lspconfig').yamlls.setup(yamlls_setup)
                require('lspconfig').docker_compose_language_service.setup(yamlls_setup)
            end,
        }
    })
    lsp_zero.setup()
    vim.diagnostic.config({
        virtual_text = true
    })
end

return {
    yamlls_setup = yamlls_setup,
    ensure_installed = ensure_installed,
    cmp_config_function = cmp_config_function,
    lsp_config_function = lsp_config_function,
}
