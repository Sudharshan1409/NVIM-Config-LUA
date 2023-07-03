vim.api.nvim_create_autocmd('filetype', {
  pattern = 'netrw',
  desc = 'Better mappings for netrw',
  callback = function()
    local bind = function(lhs, rhs)
      vim.keymap.set('n', lhs, rhs, {remap = true, buffer = true})
    end 


    -- refresh tree
    bind('r', '<Plug>NetrwRefresh')
    -- change window
    bind('<C-l>', '<C-w><C-l>')
  end
})
