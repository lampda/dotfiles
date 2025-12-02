-- nya ichi ni san arigato
return {
	"manuuurino/autoread.nvim",
	cmd = "Autoread",
	opts = {},
	config = function()
		require("autoread").setup({
			interval = 500,
			notify_on_change = true,
			cursor_behavior = "preserve",
		})
	end,
}
