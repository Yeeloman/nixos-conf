-- check https://github.com/sontungexpt/stcursorword#installation
-- for more informations
return {
	"sontungexpt/stcursorword",
	event = "VeryLazy",
	config = function()
		require("stcursorword").setup({
			highlight = {
				underline = true,
				fg = nil,
				bg = nil,
			},
		})
	end,
}
