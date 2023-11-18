function ChangeTheme(color)
    local colors = {
        "gruvbox",
        "rose-pine",
        "nord",
        "onedark",
        "dracula-soft",
    }
    -- local colorScheme = colors[math.random(#colors)]
    -- print("ColorScheme: " .. colorScheme)
    -- color = color or colorScheme
    color = color or "dracula-soft"
    vim.cmd('colorscheme ' .. color)

    local normal_hl = vim.api.nvim_get_hl_by_name('Normal', true)
    local normal_float_hl = vim.api.nvim_get_hl_by_name('NormalFloat', true)

    normal_hl.background = 'none'
    normal_float_hl.background = 'none'

    vim.api.nvim_set_hl(0, 'Normal', normal_hl)
    vim.api.nvim_set_hl(0, 'NormalFloat', normal_float_hl)

    -- Highlight current line with a custom color (dimmer)
    vim.cmd('highlight CursorLine cterm=NONE ctermbg=236 guibg=#2E323C')
end

ChangeTheme()

vim.cmd([[
augroup MyColors
    autocmd!
    autocmd VimEnter,ColorScheme * lua ChangeTheme()
augroup END
]])

function ChangeThemeSelect()
    local color = vim.fn.input("ColorScheme: ")
    ChangeTheme(color)
end

vim.keymap.set("n", "<leader>cs", "<cmd>lua ChangeThemeSelect()<cr>", { noremap = true, silent = true })
