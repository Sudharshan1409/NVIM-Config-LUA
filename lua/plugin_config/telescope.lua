local builtin = require('telescope.builtin')
local actions = require('telescope.actions')
local action_state = require('telescope.actions.state')
--vim.keymap.set('n', '<leader>ps', function() builtin.grep_string({ search = vim.fn.input("Grep > ") } );
--end)

local custom_actions = {}
require("telescope").load_extension("git_worktree")

function custom_actions.fzf_multi_select(prompt_bufnr)
    local picker = action_state.get_current_picker(prompt_bufnr)
    local num_selections = table.getn(picker:get_multi_selection())

    if num_selections > 1 then
        local picker = action_state.get_current_picker(prompt_bufnr)
        for _, entry in ipairs(picker:get_multi_selection()) do
            vim.cmd(string.format("%s %s", ":e!", entry.value))
        end
        vim.cmd('stopinsert')
    else
        actions.file_edit(prompt_bufnr)
    end
end

require('telescope').setup {
    defaults = {
        file_ignore_patterns = { "node_modules", ".git" },
        mappings = {
            i = {
                ['<esc>'] = actions.close,
                ['<C-j>'] = actions.move_selection_next,
                ['<C-k>'] = actions.move_selection_previous,
                ['<tab>'] = actions.toggle_selection + actions.move_selection_next,
                ['<s-tab>'] = actions.toggle_selection + actions.move_selection_previous,
                ['<cr>'] = custom_actions.fzf_multi_select,
                -- open file in vertical split
                ['<C-h>'] = actions.file_split,
                -- open file in horizontal split
                ['<C-v>'] = actions.file_vsplit,
            },
            n = {
                ['<esc>'] = actions.close,
                ['<tab>'] = actions.toggle_selection + actions.move_selection_next,
                ['<s-tab>'] = actions.toggle_selection + actions.move_selection_previous,
                ['<cr>'] = custom_actions.fzf_multi_select,
                -- open file in vertical split
                ['<C-h>'] = actions.file_split,
                -- open file in horizontal split
                ['<C-v>'] = actions.file_vsplit,
            }
        },
    }
}

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = "Find Files" })
vim.keymap.set('n', '<leader>ft', "<cmd>lua vim.cmd('Oil ' .. vim.fn.getcwd())<cr>",
    { desc = "Open Tree in Root Project Directory" })
vim.keymap.set('n', '<leader>fr', "<cmd>Telescope oldfiles<cr>", { desc = "Recent Files" })
vim.keymap.set('n', '<leader>fs', builtin.live_grep, { desc = "GREP Search" })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = "Find Buffers" })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = "Telescope Help" })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc = "Find Git Files" })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = "Find Keymaps" })
