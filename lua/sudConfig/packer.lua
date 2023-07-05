-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        -- or                            , branch = '0.1.x',
        requires = { {'nvim-lua/plenary.nvim'} }
    }

    use({ 'rose-pine/neovim', as = 'rose-pine' })

    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    use('nvim-treesitter/playground')
    use('theprimeagen/harpoon')
    use('mbbill/undotree')
    use('tpope/vim-fugitive')
    use('scrooloose/nerdcommenter')
    use {
        'VonHeikemen/lsp-zero.nvim',
        branch = 'v2.x',
        requires = {
            -- LSP Support
            {'neovim/nvim-lspconfig'},             -- Required
            {                                      -- Optional
            'williamboman/mason.nvim',
            run = function()
                pcall(vim.cmd, 'MasonUpdate')
            end,
        },
        {'williamboman/mason-lspconfig.nvim'}, -- Optional

        -- Autocompletion
        {'hrsh7th/nvim-cmp'},     -- Required
        {'hrsh7th/cmp-nvim-lsp'}, -- Required
        {'L3MON4D3/LuaSnip'},     -- Required
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

end)
