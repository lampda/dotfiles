require("functions")
vim.keymap.set("n", "<C-e>", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.keymap.set({ "n" }, "gw", HotToGo, { noremap = true, silent = true })
vim.keymap.set("i", "<A-m>", InsertPrint, { noremap = true, desc = "personal: printfc" })
vim.keymap.set("n", "<A-m>", "", { noremap = true, desc = "personal: printfc" })
vim.keymap.set({ "n" }, "<A-m>", "<Esc>mpyyp`pj", { noremap = true, desc = "Nya" })
vim.keymap.set({ "v" }, "<A-m>", "mzy`]p`zj", { noremap = true, desc = "Nya" })
vim.keymap.set({ "n", "x" }, "ge", "$", { noremap = true, desc = "Nya" })
vim.keymap.set({ "v" }, "ge", "$h", { noremap = true, desc = "Nya" })
vim.keymap.set({ "n", "x", "v" }, "gs", "_", { noremap = true, desc = "Nya" })
vim.keymap.set(
	"n",
	"gl",
	"<cmd>lua vim.diagnostic.open_float()<CR>",
	{ desc = "personal: show diagnostics", noremap = true, silent = true }
)
vim.keymap.set("n", "<leader>a", "<c-^>", { desc = "alternate file", noremap = true, silent = true })
vim.keymap.set("n", "<leader>A", "<c-^><wincmd>v<cr>", { desc = "alternate file", noremap = true, silent = true })
vim.keymap.set("n", "<c-s>", SaveAll, { desc = "alternate file", noremap = true, silent = true })
vim.keymap.set("n", "<leader><cr>", "<cmd>wqa!<cr>", { desc = "alternate file", noremap = true, silent = true })
-- vim.keymap.set({ "n" }, "<C-h>", "<c-w>h", { noremap = true, desc = "left split" })
-- vim.keymap.set({ "n" }, "<C-l>", "<c-w>l", { noremap = true, desc = "right split" })
-- vim.keymap.set({ "n" }, "<C-k>", "<c-w>k", { noremap = true, desc = "up split" })
-- vim.keymap.set({ "n" }, "<C-j>", "<c-w>j", { noremap = true, desc = "down split" })
vim.keymap.set({ "n" }, "<leader>;", "<cmd>nohls<cr>", { noremap = true, desc = "no high" })
vim.keymap.set({ "n" }, "<c-n>", "<cmd>cn<cr>", { noremap = true, desc = "no high" })
vim.keymap.set({ "n" }, "<c-p>", "<cmd>cp<cr>", { noremap = true, desc = "no high" })
-- vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
-- vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
-- vim.keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==")
-- vim.keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==")
function diagnostic()
	vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end
vim.keymap.set({ "n" }, "<leader>d", diagnostic, { noremap = true, desc = "replacement in selection" })
-- Toggle compiler results
vim.keymap.set("n", "<C-c>", CompilerModeChafoide)
vim.keymap.set("n", "<A-c>", "<cmd>ccl<CR>")
vim.keymap.set("n", "<leader>rn", function()
	-- it returns success status, thus you can fallback like so
	if not require("ts-autotag").rename() then
		vim.lsp.buf.rename()
	end
end)
vim.keymap.set("n", "<leader>q", "<cmd>qa<CR>")
vim.keymap.set("n", "<leader>Q", "<cmd>qa!<CR>")
