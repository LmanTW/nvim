local M = {}

--- Setup Themify.
--- @return nil
function M.setup()
  require('themify').setup({
    {
      'sho-87/kanagawa-paper.nvim',

      branch = 'master'
    },
    {
      'comfysage/evergarden',

      branch = 'mega',

      before = function()
        require('evergarden').setup({
          contrast_dark = 'hard'
        })
      end
    },
    'nyoom-engineering/oxocarbon.nvim'
  })
end

return M
