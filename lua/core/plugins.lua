-- This file can be loaded by calling `lua require("plugins")` from your init.vim
-- Only required if you have packer configured as `opt`
-- Packer can manage itself
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
    "theprimeagen/harpoon",
    "mbbill/undotree",
    "tpope/vim-fugitive",
    {
        {
            'VonHeikemen/lsp-zero.nvim',
            branch = 'v3.x',
            lazy = true,
            config = false,
            init = function()
                -- Disable automatic setup, we are doing it manually
                vim.g.lsp_zero_extend_cmp = 0
                vim.g.lsp_zero_extend_lspconfig = 0
            end,
        },
        {
            'williamboman/mason.nvim',
            lazy = false,
            config = true,
        },

        -- Autocompletion
        {
            'hrsh7th/nvim-cmp',
            event = 'InsertEnter',
            dependencies = {
                { 'L3MON4D3/LuaSnip' },
            },
        },

        -- LSP
        {
            'neovim/nvim-lspconfig',
            cmd = { 'LspInfo', 'LspInstall', 'LspStart' },
            event = { 'BufReadPre', 'BufNewFile' },
            dependencies = {
                { 'hrsh7th/cmp-nvim-lsp' },
                { 'williamboman/mason-lspconfig.nvim' },
            },
        }
    },
    "airblade/vim-rooter",
    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    },
    "neovim/nvim-lspconfig",
    "jose-elias-alvarez/null-ls.nvim",
    "MunifTanjim/prettier.nvim",
    "ThePrimeagen/vim-with-me",
    "ThePrimeagen/vim-be-good",
    "eandrju/cellular-automaton.nvim",
    "vim-airline/vim-airline",
    "vim-airline/vim-airline-themes",
    { "mg979/vim-visual-multi", branch = "master" },
    "andymass/vim-matchup",
    "RRethy/vim-illuminate",
    "godlygeek/tabular",
    "preservim/vim-markdown",
    "akinsho/toggleterm.nvim",
    "ericbn/vim-relativize",
    "LaurenceWarne/cfn-lsp-extra",
    "chase/vim-ansible-yaml",
    {
        "jackMort/ChatGPT.nvim",
        event = "VeryLazy",
        config = function()
            require("chatgpt").setup({
                api_key_cmd = "pass show api/token/openai",
            })
        end,
        dependencies = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    },
    "ggandor/lightspeed.nvim",
    "tpope/vim-commentary",
    "ryanoasis/vim-devicons",

    -- themes
    "ellisonleao/gruvbox.nvim",
    { "rose-pine/neovim",       as = "rose-pine" },
    "shaunsingh/nord.nvim",
    "navarasu/onedark.nvim",
    "Mofiqul/dracula.nvim",
    "tanvirtin/monokai.nvim",
    "mhartington/oceanic-next",

    -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
    "lewis6991/gitsigns.nvim",     -- OPTIONAL: for git status
    "romgrk/barbar.nvim",          -- OPTIONAL: for buffer tabline

    "christoomey/vim-tmux-navigator",
    "petertriho/nvim-scrollbar",
    "zyedidia/vim-snake",
    "levouh/tint.nvim",
    "sharkdp/fd",
    {
        "linux-cultist/venv-selector.nvim",
        dependencies = { "neovim/nvim-lspconfig", "nvim-telescope/telescope.nvim", "mfussenegger/nvim-dap-python" },
        opts = {
            -- Your options go here
            -- name = "venv",
            -- auto_refresh = false
        },
        config = function()
            require("venv_selector").setup({
                -- Your configuration comes here
                -- or leave it empty to use the default settings
                -- Refer to the configuration section below
            })
        end,
        keys = {
            -- Keymap to open VenvSelector to pick a venv.
            { "<leader>vs", "<cmd>VenvSelect<cr>" },
            -- Keymap to retrieve the venv from a cache (the one previously used for the same project directory).
            { "<leader>vc", "<cmd>VenvSelectCached<cr>" },
        }
    },
}

local opts = {}

require("lazy").setup(plugins, opts)
