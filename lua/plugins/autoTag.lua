-- check https://github.com/windwp/nvim-ts-autotag
-- for more informations
return {
	"windwp/nvim-ts-autotag",
	lazy = false,
  config = function()
    require('nvim-ts-autotag').setup()
  end,
}
