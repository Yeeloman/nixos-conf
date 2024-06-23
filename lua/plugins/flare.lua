-- check https://github.com/stonelasley/flare.nvim
-- for more infos
return {
  'stonelasley/flare.nvim',
  lazy = false,
  config = function() require('flare').setup() end
}
