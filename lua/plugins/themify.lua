local M = {}

--- Setup Themify.
--- @return nil
function M.setup()
  require('themify').setup({
    activity = true,

    {
      'comfysage/evergarden',

      branch = 'mega',

      before = function()
        vim.g.everforest_background = 'hard'
        vim.g.everforest_better_performance = 1
      end
    },
    {
      'sainnhe/gruvbox-material',

      before = function()
        vim.g.gruvbox_material_background = 'hard'
        vim.g.gruvbox_material_better_performance = 1
      end
    },
    'nyoom-engineering/oxocarbon.nvim'
  })
end

return M
