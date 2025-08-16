local conform = require("conform")

conform.setup({
	default_format_opts = {
		lsp_format = "fallback",
	},
	formatters_by_ft = {
		lua = { "stylua" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
	},
})

vim.keymap.set("n", "<leader><leader>", function()
	conform.format()
end)
