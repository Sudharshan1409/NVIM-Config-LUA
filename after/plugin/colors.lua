function ColorMyPencils(color)
    color = color or "rose-pine"
    vim.cmd('colorscheme ' .. color)

    local normal_hl = vim.api.nvim_get_hl_by_name('Normal', true)
    local normal_float_hl = vim.api.nvim_get_hl_by_name('NormalFloat', true)

    normal_hl.background = 'none'
    normal_float_hl.background = 'none'

    vim.api.nvim_set_hl(0, 'Normal', normal_hl)
    vim.api.nvim_set_hl(0, 'NormalFloat', normal_float_hl)
end

ColorMyPencils()

vim.cmd([[
augroup MyColors
    autocmd!
    autocmd VimEnter,ColorScheme * lua ColorMyPencils()
augroup END
]])
