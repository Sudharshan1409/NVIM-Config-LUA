local keymap = vim.keymap.set

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")

--split navigations
keymap("n", "<C-j>", "TmuxNavigateDown", { desc = "Navigate Window Down" })
keymap("n", "<C-k>", "TmuxNavigateUp", { desc = "Navigate Window Up" })
keymap("n", "<C-l>", "TmuxNavigateRight", { desc = "Navigate Window Right" })
keymap("n", "<C-h>", "TmuxNavigateLeft", { desc = "Navigate Window Left" })

keymap("n", "J", "mzJ`z", { desc = "Keep cursor in the beginning when joining lines" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Keep line in the middle when scrolling down" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Keep line in the middle when scrolling up" })
keymap("n", "n", "nzzzv", { desc = "Keep line in the middle when searching next" })
keymap("n", "N", "Nzzzv", { desc = "Keep line in the middle when searching previous" })

-- keymap to create buffer and open file
keymap("n", "<leader>fo", "<cmd>e hello.txt<CR>", { silent = true, desc = "Open buffer for reference" })

-- greatest remap ever
keymap("x", "<leader>p", [["_dPgv=gv]],
    { silent = true, desc = "While pasting in visual mode retain copied content at top of register" })
keymap("n", "<leader>p", [["+p]])
keymap("n", "<leader>P", [["+P]])

-- next greatest remap ever : asbjornHaland
keymap({ "n", "v" }, "<leader>y", [["+y]])
keymap("n", "<leader>Y", [["+Y]])

keymap({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
keymap("i", "<C-c>", "<Esc>")

keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- insert a line without going to insert mode
keymap("n", "<leader>o", "o<Esc>")
keymap("n", "<leader>O", "O<Esc>")

keymap("n", "<leader>k", "<cmd>cnext<CR>zz")
keymap("n", "<leader>j", "<cmd>cprev<CR>zz")

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("v", "<leader>s", [[:'<,'>s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>sl", ":lua SEARCH_AND_REPLACE_DYNAMIC()<CR>")

keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- make file executable

-- open packer file anywhere
keymap("n", "<leader>pf", "<cmd>e ~/.config/nvim/lua/core/plugins.lua<CR>");
keymap("n", "<leader>vpf", "<cmd>vs ~/.config/nvim/lua/core/plugins.lua<CR>");
keymap("n", "<leader>hpf", "<cmd>sp ~/.config/nvim/lua/core/plugins.lua<CR>");

-- open remap file anywhere
keymap("n", "<leader>rf", "<cmd>e ~/.config/nvim/lua/core/remap.lua<CR>");
keymap("n", "<leader>vrf", "<cmd>vs ~/.config/nvim/lua/core/remap.lua<CR>");
keymap("n", "<leader>hrf", "<cmd>sp ~/.config/nvim/lua/core/remap.lua<CR>");

-- open set file anywhere
keymap("n", "<leader>sf", "<cmd>e ~/.config/nvim/lua/core/set.lua<CR>");
keymap("n", "<leader>vsf", "<cmd>vs ~/.config/nvim/lua/core/set.lua<CR>");
keymap("n", "<leader>hsf", "<cmd>sp ~/.config/nvim/lua/core/set.lua<CR>");

-- open terminal in splits
keymap("n", "<leader>vt", "<cmd>100 vs | term<CR>");
keymap("n", "<leader>ht", "<cmd>sp | term<CR>");

-- open nvim file in popup
keymap("n", "<leader>nvim",
    "<cmd>lua require('telescope.builtin').find_files({prompt_title = 'Nvim  Config', cwd = '~/.config/nvim/', hidden = false})<CR>");

-- oil.nvim shortcuts
keymap("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- barbar config
-- Move to previous/next
keymap('n', '<s-tab>', '<Cmd>BufferPrevious<CR>', opts)
keymap('n', '<tab>', '<Cmd>BufferNext<CR>', opts)

keymap("i", "jk", "<esc>", opts)
keymap("i", "kj", "<esc>", opts)

keymap("v", "<", "<gv", opts) -- Right Indentation
keymap("v", ">", ">gv", opts) -- Left Indentation

-- Pin the buffer
keymap('n', '<leader>pb', '<Cmd>BufferPin<CR>', opts)

-- Close all buffer except pinned
keymap('n', '<leader>bcp', '<Cmd>BufferCloseAllButPinned<CR>', opts)

-- Close all buffer except current
keymap('n', '<leader>bc', '<Cmd>BufferCloseAllButCurrent<CR>', opts)

-- Re-order to previous/next
keymap('n', '<leader>bp', '<Cmd>BufferPick<CR>', opts)

-- Close buffer
vim.api.nvim_set_keymap('n', '<leader>cb', '<Cmd>BufferClose<CR>', opts)

-- Replace ' by " in entire file
keymap("n", "<leader>std", ":%s/'/\"/g<CR>")

-- Replace " by ' in entire file
keymap("n", "<leader>dts", ":%s/\"/'/g<CR>")

-- change terminal exit command
keymap("t", "<C-q>", "<C-\\><C-n>")

keymap("n", "<leader><leader>", function()
    vim.cmd("so")
end)

keymap("n", "<leader>W", function()
    vim.cmd("wa")
end)

keymap("n", "<leader>Q", function()
    vim.cmd("qa")
end)
