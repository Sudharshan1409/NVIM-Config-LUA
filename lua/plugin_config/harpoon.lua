local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<leader>ho", ui.toggle_quick_menu)
vim.keymap.set("n", "<leader>nh", ui.nav_next)
vim.keymap.set("n", "<leader>ph", ui.nav_prev)
