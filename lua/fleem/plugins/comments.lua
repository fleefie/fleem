-- Comment toggle keybind
return {
	lazy = false,
	"numToStr/Comment.nvim",
	config = function()
		require("Comment").setup()
	end,
}
