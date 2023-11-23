vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.wrap = false
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.mouse = "a"
vim.opt.encoding = "utf-8"
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.wo.cursorline = true

vim.g["netrw_localrmdir"] = "rm -r"
-- Set the escape sequence to change the cursor to a line cursor in insert mode
vim.api.nvim_command('let &t_SI = "\\e[6 q"')

vim.g.blamer_emabled = true
vim.g.blamer_delay = 500
vim.g.blamer_show_in_visual_modes = 0
vim.g.blamer_show_in_insert_modes = 0


vim.api.nvim_exec([[
augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END
]], false)
