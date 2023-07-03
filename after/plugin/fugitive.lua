vim.keymap.set("n", "<leader>gs", vim.cmd.Git);
vim.keymap.set("n", "<leader>gd", vim.cmd.Gdiffsplit);
vim.keymap.set("n", "<leader>ga", "<cmd>Git add .<cr>");
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<cr>");
vim.keymap.set("n", "<leader>gp", "<cmd>lua PromptPush()<cr>");
vim.keymap.set("n", "<leader>gl", "<cmd>Git log<cr>");
vim.keymap.set("n", "<leader>gb", "<cmd>Git blame<cr>");
