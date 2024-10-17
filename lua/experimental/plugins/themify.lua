local M = {}

--- Setup Themify
--- @return nil
function M.setup()
  require('themify').setup({
    {
      'sho-87/kanagawa-paper.nvim',

       branch = 'master'
    },
    'mellow-theme/mellow.nvim',
    {
      'folke/tokyonight.nvim',

      whitelist = {'tokyonight-night'}
    }
    --- "bettervim/yugen.nvim"
  })
end

return M
