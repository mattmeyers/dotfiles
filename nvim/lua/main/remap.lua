vim.keymap.set("n", "<leader>ft", vim.cmd.Ex)

vim.keymap.set({ "n", "v" }, "gh", "^")
vim.keymap.set({ "n", "v" }, "gl", "$")

vim.keymap.set("n", "Q", "<nop>")

vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "<leader><leader>", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>z", function() vim.cmd("bufdo e") end)
