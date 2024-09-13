return {
	"lervag/vimtex",
	lazy = true,
	config = function()
		vim.g.vimtex_view_method = "zathura"
		require("vimtex").setup()
	end,
}
