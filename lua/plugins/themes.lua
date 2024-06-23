return {
	-- { "liuchengxu/space-vim-dark" },
	{ "sjl/badwolf" },
	{ "sainnhe/everforest" },
	{ "cseelus/vim-colors-lucid" },
	{ "challenger-deep-theme/vim" },
	{ "ayu-theme/ayu-vim" },
	{ "kyoh86/momiji" },
	{ "NLKNguyen/papercolor-theme" },
	{ "catppuccin/nvim", as = "catppuccin" },
	{ "xero/miasma.nvim" },
	{ "maxmx03/dracula.nvim" },
	{ "Abstract-IDE/Abstract-cs" },
	{ "ribru17/bamboo.nvim" },
	{ "sekke276/dark_flat.nvim" },
	{
		"scottmckendry/cyberdream.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			require("cyberdream").setup({
				-- Recommended - see "Configuring" below for more config options
				transparent = true,
				italic_comments = true,
				hide_fillchars = true,
				borderless_telescope = true,
			})
			vim.cmd("colorscheme everforest") -- set the colorscheme
		end,
	},
}
