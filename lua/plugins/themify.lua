local M = {}

--- Setup Themify.
--- @return nil
function M.setup()
  require('themify').setup({
    {
      'comfysage/evergarden',

      branch = 'mega',

      before = function()
        require('evergarden').setup({
          contrast_dark = 'hard'
        })
      end
    }
  })
end

return M
