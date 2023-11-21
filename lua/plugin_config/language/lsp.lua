local lsp = require("lsp-zero")

lsp.preset("recommended")
lsp.extend_lspconfig()

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Select }
local cmp_mappings = lsp.defaults.cmp_mappings({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-y>'] = cmp.mapping.confirm({ select = true }),
    ["<C-o>"] = cmp.mapping.complete(),
})

cmp_mappings['<Tab>'] = nil
cmp_mappings['<S-Tab>'] = nil

cmp.setup({
    formatting = lsp.cmp_format(),
    mappping = cmp_mappings
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
    vim.keymap.set("n", "<leader>skw", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>ed", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "]", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>gr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts)
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
        ['tsserver'] = { 'typescript' },
        ['null-ls'] = { 'javascript', 'typescript', },
        ['yaml-language-server'] = { 'yaml', 'yml' },
        ['jsonls'] = { 'json' },
        ['html'] = { 'html' },
        ['cssls'] = { 'css' },
        ['graphql'] = { 'graphql' },
        ['pyright'] = { 'python' },
    }
})

lsp.setup()



vim.diagnostic.config({
    virtual_text = true
})
