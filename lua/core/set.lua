local opt = vim.opt

opt.nu = true
opt.relativenumber = true
opt.ignorecase = true

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.autoindent = true

opt.wrap = false
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.mouse = "a"
opt.encoding = "utf-8"
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.hlsearch = false
opt.incsearch = true
opt.inccommand = "nosplit"

opt.termguicolors = true
opt.smartcase = true
opt.spelllang = { "en" }
opt.termguicolors = true
vim.g.markdown_recommended_style = 0

opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")

opt.updatetime = 50
opt.cursorline = true
opt.foldmethod = "indent"
opt.foldlevel = 99
opt.foldenable = false
opt.foldcolumn = "1"

vim.g["netrw_localrmdir"] = "rm -r"
-- Set the escape sequence to change the cursor to a line cursor in insert mode
vim.api.nvim_command('let &t_SI = "\\e[6 q"')

vim.api.nvim_create_augroup("custom_buffer", { clear = true })

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    group = "custom_buffer",
    pattern = "*",
    callback = function() vim.highlight.on_yank { timeout = 200 } end
})

vim.api.nvim_exec([[
augroup Mkdir
  autocmd!
  autocmd BufWritePre * call mkdir(expand("<afile>:p:h"), "p")
augroup END
]], false)
