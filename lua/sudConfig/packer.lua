-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'


    use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            { 'neovim/nvim-lspconfig' }, -- Required
            {                            -- Optional
                'williamboman/mason.nvim',
                run = function()
                    pcall(vim.cmd, 'MasonUpdate')
                end,
            },
            { 'williamboman/mason-lspconfig.nvim' }, -- Optional

            -- Autocompletion
            { 'hrsh7th/nvim-cmp' },     -- Required
            { 'hrsh7th/cmp-nvim-lsp' }, -- Required
            { 'L3MON4D3/LuaSnip' },     -- Required
        }
    }
    use('airblade/vim-rooter')
    use('tpope/vim-surround')
    use('neovim/nvim-lspconfig')
    use('jose-elias-alvarez/null-ls.nvim')
    use('MunifTanjim/prettier.nvim')
    use('ThePrimeagen/vim-with-me')
    use('ThePrimeagen/vim-be-good')
    use('eandrju/cellular-automaton.nvim')
    use('vim-airline/vim-airline')
    use('vim-airline/vim-airline-themes')
    use { 'mg979/vim-visual-multi', branch = 'master' }
    use('andymass/vim-matchup')
    use('RRethy/vim-illuminate')
    use('godlygeek/tabular')
    use('preservim/vim-markdown')
    use('akinsho/toggleterm.nvim')
    use('ericbn/vim-relativize')
    use('LaurenceWarne/cfn-lsp-extra')
    use('chase/vim-ansible-yaml')
    use({
        "jackMort/ChatGPT.nvim",
        requires = {
            "MunifTanjim/nui.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim"
        }
    })
    use('ggandor/lightspeed.nvim')
    use('tpope/vim-commentary')
    use('ryanoasis/vim-devicons')
    use('preservim/nerdtree')

    -- themes
    use('ellisonleao/gruvbox.nvim')
    use({ 'rose-pine/neovim', as = 'rose-pine' })
    use('shaunsingh/nord.nvim')
    use('navarasu/onedark.nvim')
    use('Mofiqul/dracula.nvim')
    use('tanvirtin/monokai.nvim')
    use('mhartington/oceanic-next')

    -- These optional plugins should be loaded directly because of a bug in Packer lazy loading
    use('nvim-tree/nvim-web-devicons') -- OPTIONAL: for file icons
    use('lewis6991/gitsigns.nvim')     -- OPTIONAL: for git status
    use('romgrk/barbar.nvim')          -- OPTIONAL: for buffer tabline

    use("christoomey/vim-tmux-navigator")
end)
