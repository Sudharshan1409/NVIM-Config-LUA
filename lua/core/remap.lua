vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ft", "<cmd>Oil --float<CR>", { desc = "Open parent directory" })

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--split navigations
vim.keymap.set("n", "<C-j>", "TmuxNavigateDown")
vim.keymap.set("n", "<C-k>", "TmuxNavigateUp")
vim.keymap.set("n", "<C-l>", "TmuxNavigateRight")
vim.keymap.set("n", "<C-h>", "TmuxNavigateLeft")

local opts = { noremap = true, silent = true }

-- Change 2 split windows from vertical to horizontal or vice versa
vim.api.nvim_set_keymap("n", "<leader>th", "<C-W>t<C-W>H", opts)
vim.api.nvim_set_keymap("n", "<leader>tk", "<C-W>t<C-W>K", opts)

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- keymap to create buffer and open file
vim.keymap.set("n", "<leader>fo", "<cmd>e hello.txt<CR>", { silent = true })

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set("n", "<leader>p", [["+p]])
vim.keymap.set("n", "<leader>P", [["+P]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>fr", vim.lsp.buf.format)

-- insert a line without going to insert mode
vim.keymap.set("n", "<leader>o", "o<Esc>")
vim.keymap.set("n", "<leader>O", "O<Esc>")

vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>s2", [[:.,+2s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>s3", [[:.,+3s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>s4", [[:.,+4s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>s5", [[:.,+5s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>s6", [[:.,+6s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>s7", [[:.,+7s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>s8", [[:.,+8s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>s9", [[:.,+9s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true }) -- make file executable

-- open packer file anywhere
vim.keymap.set("n", "<leader>pf", "<cmd>e ~/.config/nvim/lua/core/plugins.lua<CR>");
vim.keymap.set("n", "<leader>vpf", "<cmd>vs ~/.config/nvim/lua/core/plugins.lua<CR>");
vim.keymap.set("n", "<leader>hpf", "<cmd>sp ~/.config/nvim/lua/core/plugins.lua<CR>");

-- open remap file anywhere
vim.keymap.set("n", "<leader>rf", "<cmd>e ~/.config/nvim/lua/core/remap.lua<CR>");
vim.keymap.set("n", "<leader>vrf", "<cmd>vs ~/.config/nvim/lua/core/remap.lua<CR>");
vim.keymap.set("n", "<leader>hrf", "<cmd>sp ~/.config/nvim/lua/core/remap.lua<CR>");

-- open set file anywhere
vim.keymap.set("n", "<leader>sf", "<cmd>e ~/.config/nvim/lua/core/set.lua<CR>");
vim.keymap.set("n", "<leader>vsf", "<cmd>vs ~/.config/nvim/lua/core/set.lua<CR>");
vim.keymap.set("n", "<leader>hsf", "<cmd>sp ~/.config/nvim/lua/core/set.lua<CR>");

-- open telescope file anywhere
vim.keymap.set("n", "<leader>tf", "<cmd>e ~/.config/nvim/after/plugin/telescope.lua<CR>");
vim.keymap.set("n", "<leader>vtf", "<cmd>vs ~/.config/nvim/after/plugin/telescope.lua<CR>");
vim.keymap.set("n", "<leader>htf", "<cmd>sp ~/.config/nvim/after/plugin/telescope.lua<CR>");


-- Celluar Automaton Stuff
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- open terminal in splits
vim.keymap.set("n", "<leader>vt", "<cmd>100 vs | term<CR>");
vim.keymap.set("n", "<leader>ht", "<cmd>sp | term<CR>");

-- open nvim file in popup
vim.keymap.set("n", "<leader>nvim",
    "<cmd>lua require('telescope.builtin').find_files({prompt_title = 'Nvim  Config', cwd = '~/.config/nvim/', hidden = false})<CR>");

-- oil.nvim shortcuts
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- barbar config
-- Move to previous/next
vim.keymap.set('n', '<leader><Left>', '<Cmd>BufferPrevious<CR>', opts)
vim.keymap.set('n', '<leader><Right>', '<Cmd>BufferNext<CR>', opts)

-- Pin the buffer
vim.keymap.set('n', '<leader>pb', '<Cmd>BufferPin<CR>', opts)

-- Close all buffer except pinned
vim.keymap.set('n', '<leader>bcp', '<Cmd>BufferCloseAllButPinned<CR>', opts)

-- Close all buffer except current
vim.keymap.set('n', '<leader>bc', '<Cmd>BufferCloseAllButCurrent<CR>', opts)

-- Re-order to previous/next
vim.keymap.set('n', '<leader>bp', '<Cmd>BufferPick<CR>', opts)

-- Close buffer
vim.api.nvim_set_keymap('n', '<leader>cb', '<Cmd>BufferClose<CR>', opts)

-- Replace ' by " in entire file
vim.keymap.set("n", "<leader>std", ":%s/'/\"/g<CR>")

-- Replace " by ' in entire file
vim.keymap.set("n", "<leader>dts", ":%s/\"/'/g<CR>")

-- change terminal exit command
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>")

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

vim.keymap.set("n", "<leader>w", function()
    vim.cmd("w")
end)

vim.keymap.set("n", "<leader>W", function()
    vim.cmd("wa")
end)

vim.keymap.set("n", "<leader>q", function()
    vim.cmd("q")
end)

vim.keymap.set("n", "<leader>Q", function()
    vim.cmd("qa")
end)
