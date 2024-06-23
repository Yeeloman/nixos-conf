return {
  "/norcalli/nvim-colorizer.lua",
  -- event = "VeryLazy",
  lazy = false,
  config = function()
    require 'colorizer'.setup()
  end,
	vim.keymap.set("n", "<leader>co", ":ColorizerToggle<CR>", { noremap = true, silent = true }),
}

