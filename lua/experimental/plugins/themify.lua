local M = {}

--- Setup Themify
--- @return nil
function M.setup()
  require('themify').setup({
    {
      'sho-87/kanagawa-paper.nvim',

      branch = 'master'
    },
    {
      'folke/tokyonight.nvim',

      whitelist = {'tokyonight-night'}
    },
    {
      'Yazeed1s/minimal.nvim',

      whitelist = {'minimal-base16'}
    }
  })
end

return M