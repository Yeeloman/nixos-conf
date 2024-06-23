-- check https://github.com/AckslD/muren.nvim/
-- for more informations
return {
  'AckslD/muren.nvim',
  event = "VeryLazy",
  config = true,
  vim.keymap.set(
    'n',
    '<leader>rv',
    ':MurenToggle<CR>',
    {}
  ),
}
