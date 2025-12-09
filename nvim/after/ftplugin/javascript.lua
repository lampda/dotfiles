vim.api.nvim_buf_set_keymap(0, "n", "<leader>h", "<cmd>Oil src/hooks <CR>", { noremap = true })
vim.api.nvim_buf_set_keymap(0, "n", "<leader>u", "<cmd>Oil src/components <CR>", { noremap = true })
vim.api.nvim_buf_set_keymap(0, "n", "<leader>c", "<cmd>Oil src/contexts <CR>", { noremap = true })
vim.api.nvim_buf_set_keymap(0, "n", "<leader>i", "<cmd>Oil src/api <CR>", { noremap = true })
