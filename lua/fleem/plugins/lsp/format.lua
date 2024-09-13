-- Conform for formatters! Yay.
return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				-- Add formatters here.
				lua = { "stylua" },
				rust = { "rustfmt" },
				c = { "clang-format" },
				cpp = { "clang-format" },
				latex = { "latexindent" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeout_ms = 1000,
			},
			default_format_opts = {
				lsp_format = "fallback",
			},
		})

		vim.keymap.set({ "n", "x", "v" }, "<F3>", "<cmd>lua require('conform').format()<cr>")

		local wk = require("which-key")
		wk.add({
			{
				"<leader>lf",
				"<cmd>lua require('conform').format()<cr>",
				desc = "Format",
				nowait = true,
				remap = false,
			},
		})
	end,
}
