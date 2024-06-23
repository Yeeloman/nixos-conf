-- check https://github.com/miversen33/sunglasses.nvim
-- for more informations
return {
	"miversen33/sunglasses.nvim",
	event = "UIEnter",
	config = {
		filter_type = "SHADE", -- some other options: NOSYNTAX TINT
		filter_percent = 0.25,
	},
}
