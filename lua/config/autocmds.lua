-- 1. Enable Sublime-style line wrapping for .txt files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
  pattern = { "*.txt" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.linebreak = true -- Wraps at word boundaries instead of cutting words in half
  end,
})

-- Automatically resize Neovim splits if the terminal window is resized
vim.api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
  desc = "Automatically resize splits when terminal is resized",
})
