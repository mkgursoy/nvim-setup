return {
  {
    "shaunsingh/doom-vibrant.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.doom_italic = false
      vim.g.doom_contrast = false
      vim.g.doom_disable_background = false

      require("doom").set()

      local line_nr = vim.api.nvim_get_hl(0, { name = "LineNr" })

      if line_nr and line_nr.fg then
        vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = line_nr.fg })
      end

      vim.opt.statuscolumn = " %l "
    end,
  },
}
