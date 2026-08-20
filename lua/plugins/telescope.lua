return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local builtin = require('telescope.builtin')
      -- Quick keymap to trigger colorscheme preview
      vim.keymap.set('n', '<leader>th', builtin.colorscheme, { desc = 'Themes preview' })
    end,
  },
}
