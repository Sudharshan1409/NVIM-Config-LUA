vim.g.mapleader = " "
vim.keymap.set("n", "<leader>ft", vim.cmd.Ex)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

--split navigations
vim.keymap.set("n", "<C-j>", "<C-w><C-j>")
vim.keymap.set("n", "<C-k>", "<C-w><C-k>")
vim.keymap.set("n", "<C-l>", "<C-w><C-l>")
vim.keymap.set("n", "<C-h>", "<C-w><C-h>")

-- Set key mappings for split resizes
vim.api.nvim_set_keymap("n", "<C-S-j>", "<cmd>resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-k>", "<cmd>resize -2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-l>", "<cmd>vertical resize +2<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<C-S-h>", "<cmd>vertical resize -2<CR>", { noremap = true, silent = true })

-- Change 2 split windows from vertical to horizontal or vice versa
vim.api.nvim_set_keymap("n", "<leader>th", "<C-W>t<C-W>H", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "<leader>tk", "<C-W>t<C-W>K", { noremap = true, silent = true })



vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")

vim.keymap.set("n", "Q", "<cmd>q<CR>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>k", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>cprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- open packer file anywhere
vim.keymap.set("n", "<leader>pf", "<cmd>e ~/.config/nvim/lua/sudConfig/packer.lua<CR>");
vim.keymap.set("n", "<leader>vpf", "<cmd>vs ~/.config/nvim/lua/sudConfig/packer.lua<CR>");
vim.keymap.set("n", "<leader>hpf", "<cmd>sp ~/.config/nvim/lua/sudConfig/packer.lua<CR>");

-- open remap file anywhere
vim.keymap.set("n", "<leader>rf", "<cmd>e ~/.config/nvim/lua/sudConfig/remap.lua<CR>");
vim.keymap.set("n", "<leader>vrf", "<cmd>vs ~/.config/nvim/lua/sudConfig/remap.lua<CR>");
vim.keymap.set("n", "<leader>hrf", "<cmd>sp ~/.config/nvim/lua/sudConfig/remap.lua<CR>");

-- open set set file anywhere
vim.keymap.set("n", "<leader>sf", "<cmd>e ~/.config/nvim/lua/sudConfig/set.lua<CR>");
vim.keymap.set("n", "<leader>vsf", "<cmd>vs ~/.config/nvim/lua/sudConfig/set.lua<CR>");
vim.keymap.set("n", "<leader>hsf", "<cmd>sp ~/.config/nvim/lua/sudConfig/set.lua<CR>");

-- Celluar Automaton Stuff
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

-- open terminal in splits
vim.keymap.set("n", "<leader>vt", "<cmd>vs | term<CR>");
vim.keymap.set("n", "<leader>ht", "<cmd>sp | term<CR>");

-- change terminal exit command
vim.keymap.set("t", "<C-q>", "<C-\\><C-n>")
vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)
