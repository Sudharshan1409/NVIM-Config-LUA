local keymap = vim.keymap.set

local utils = require("core.utils")

local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

keymap("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line up/down in visual mode" })
keymap("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up/down in visual mode" })

--split navigations
keymap("n", "<C-j>", "TmuxNavigateDown", { desc = "Navigate Window Down" })
keymap("n", "<C-k>", "TmuxNavigateUp", { desc = "Navigate Window Up" })
keymap("n", "<C-l>", "TmuxNavigateRight", { desc = "Navigate Window Right" })
keymap("n", "<C-h>", "TmuxNavigateLeft", { desc = "Navigate Window Left" })

keymap("n", "J", "mzJ`z", { desc = "Keep cursor in the beginning when joining lines" })
keymap("n", "<C-d>", "<C-d>zz", { desc = "Keep line in the middle when scrolling down" })
keymap("n", "<C-u>", "<C-u>zz", { desc = "Keep line in the middle when scrolling up" })
keymap("n", "G", "Gzz", { desc = "Keep line in the middle when going to last line" })
keymap("i", "<C-j>", "<Down><Down><Down><Down><Down>", { desc = "Move cursor 5 lines down" })
keymap("i", "<C-k>", "<Up><Up><Up><Up><Up>", { desc = "Move cursor 5 lines up" })
keymap("n", "n", "nzzzv", { desc = "Keep line in the middle when searching next" })
keymap("n", "N", "Nzzzv", { desc = "Keep line in the middle when searching previous" })

-- keymap to create buffer and open file
keymap("n", "<leader>fo", "<cmd>e hello.txt<CR>", { silent = true, desc = "Open buffer for reference" })

-- greatest remap ever
keymap("x", "<leader>p", [["_dPgv=gv]],
    { silent = true, desc = "While pasting in visual mode retain copied content at top of register" })
keymap("n", "<leader>p", [["+p]], { desc = "Paste from system clipboard down" })
keymap("n", "<leader>P", [["+P]], { desc = "Paste from system clipboard up" })

-- next greatest remap ever : asbjornHaland
keymap({ "n", "v" }, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
keymap("n", "<leader>Y", [["+Y]], { desc = "Copy to system clipboard" })

keymap({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete to blackhole register" })

keymap("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Open tmux sessionizer" })

-- insert a line without going to insert mode
keymap("n", "<leader>o", "o<Esc>", { desc = "Insert line below and stay in normal mode" })
keymap("n", "<leader>O", "O<Esc>", { desc = "Insert line above and stay in normal mode" })

keymap("n", "<leader>k", "<cmd>cnext<CR>zz", { desc = "Go to next quickfix" })
keymap("n", "<leader>j", "<cmd>cprev<CR>zz", { desc = "Go to previous quickfix" })

keymap("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], { desc = "Search and replace" })
keymap("n", "<leader>sl", ":lua SEARCH_AND_REPLACE_DYNAMIC()<CR>", { desc = "Search and replace for N lines" })
keymap("n", "<leader>sn", "/<C-r><C-w><cr>", { desc = "Search and replace" })
keymap("n", "<leader>sp", "?<C-r><C-w><cr>", { desc = "Search and replace" })

keymap("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" }) -- make file executable

keymap({ "n", "x" }, "<leader>r", "<cmd>lua vim.lsp.buf.format{async=true}<cr>",
    { desc = "Reformat Code", silent = true })

-- open nvim file in popup
keymap("n", "<leader>nvim",
    "<cmd>lua require('telescope.builtin').find_files({prompt_title = 'Nvim  Config', cwd = '~/.config/nvim/', hidden = false})<CR>",
    { desc = "Open Nvim Config" });

-- oil.nvim shortcuts
keymap("n", "-", "<CMD>Oil<CR>", { desc = "OIL: Open parent directory" })

-- url supports
keymap("n", "ci/", "T/vt/c", { desc = "Change inside URL Slash" })
keymap("n", "vi/", "T/vt/", { desc = "Select inside URL Slash" })
keymap("n", "di/", "T/vt/d", { desc = "Delete inside URL Slash" })
keymap("n", "yi/", "T/vt/y", { desc = "Copy inside URL Slash" })

keymap("n", "ca/", "T/vf/c", { desc = "Change inside URL Slach with Slach" })
keymap("n", "va/", "T/vf/", { desc = "Select inside URL Slash with Slach" })
keymap("n", "da/", "T/vf/d", { desc = "Delete inside URL Slash with Slach" })
keymap("n", "ya/", "T/vf/y", { desc = "Copy inside URL Slash with Slach" })

-- barbar config
-- Move to previous/next
keymap('n', '<s-tab>', '<Cmd>BufferPrevious<CR>', utils.addDesc(opts, "Go to Previous Buffer"))
keymap('n', '<tab>', '<Cmd>BufferNext<CR>', utils.addDesc(opts, "Go to Next Buffer"))

keymap("i", "jk", "<esc>", utils.addDesc(opts, "Exit Insert Mode"))
keymap("i", "kj", "<esc>", utils.addDesc(opts, "Exit Insert Mode"))
keymap("i", "JK", "<esc>", utils.addDesc(opts, "Exit Insert Mode"))
keymap("i", "KJ", "<esc>", utils.addDesc(opts, "Exit Insert Mode"))

keymap("v", ">", ">gv", utils.addDesc(opts, "Left Indent but stay in visual mode")) -- Left Indentation

-- Pin the buffer
keymap('n', '<leader>pb', '<Cmd>BufferPin<CR>', utils.addDesc(opts, "Pin Buffer"))

-- Close all buffer except pinned
keymap('n', '<leader>bcp', '<Cmd>BufferCloseAllButPinned<CR>', utils.addDesc(opts, "Close all buffer except pinned"))

-- Close all buffer except current
keymap('n', '<leader>bc', '<Cmd>BufferCloseAllButCurrent<CR>', utils.addDesc(opts, "Close all buffer except current"))

-- Re-order to previous/next
keymap('n', '<leader>bp', '<Cmd>BufferPick<CR>', utils.addDesc(opts, "Pick Buffer"))

keymap('n', 'zs', '<Cmd>SymbolsOutline<CR>', utils.addDesc(opts, "Open Symbols Outline"))

-- Close buffer
vim.api.nvim_set_keymap('n', '<leader>cb', '<Cmd>BufferClose<CR>', utils.addDesc(opts, "Close Buffer"))

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
    vim.cmd("wa!")
end)

keymap("n", "<leader>w", function()
    vim.cmd("w!")
end)
keymap("n", "<leader>q", "<cmd>:q<CR>", { silent = true, desc = "Quit NeoVim Session" }) -- Quit Neovim after saving the file

keymap("n", "<leader>Q", function()
    vim.cmd("qa")
end)
