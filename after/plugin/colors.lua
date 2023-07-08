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
    color = color or "gruvbox"
    vim.cmd('colorscheme ' .. color)

    local normal_hl = vim.api.nvim_get_hl_by_name('Normal', true)
    local normal_float_hl = vim.api.nvim_get_hl_by_name('NormalFloat', true)

    normal_hl.background = 'none'
    normal_float_hl.background = 'none'

    vim.api.nvim_set_hl(0, 'Normal', normal_hl)
    vim.api.nvim_set_hl(0, 'NormalFloat', normal_float_hl)
end

ChangeTheme()

vim.cmd([[
augroup MyColors
    autocmd!
    autocmd VimEnter,ColorScheme * lua ChangeTheme()
augroup END
]])
