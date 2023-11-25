function SEARCH_AND_REPLACE_DYNAMIC()
    -- Ask the user to input the number of lines
    local number_of_lines = vim.fn.input('Enter number of lines: ')

    -- Check if a valid number of lines is provided
    if tonumber(number_of_lines) then
        -- Construct the command for substitution
        local command = string.format(':.,+%ds/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>',
            tonumber(number_of_lines))

        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(command, true, true, true), 'n', true)
    else
        print('Invalid input. Please provide a number.')
    end
end
