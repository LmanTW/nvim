local Themify = require('themify.api')

local M = {}

--- Setup Lualine.
--- @return nil
function M.setup()
  vim.o.cmdheight = 0

  local colorscheme = Themify.get_current()
  local usage = Themify.Activity.get(colorscheme.colorscheme_id, colorscheme.theme)

  Themify.Event.listen('colorscheme-loaded', function(colorscheme_id, theme)
    colorscheme = { colorscheme_id = colorscheme_id, theme = theme }
    usage = Themify.Activity.get(colorscheme_id, theme)
  end)

  Themify.Event.listen('activity-update', function()
    usage = Themify.Activity.get(colorscheme.colorscheme_id, colorscheme.theme)
  end)

  require('lualine').setup({
    options = {
      globalstatus = true,

      section_separators = { left = '', right = '' },
      component_separators = { left = '', right = '' },

      disabled_filetypes = {
        statusline = {'snacks_dashboard', 'NvimTree', 'toggleterm', 'snacks_picker_input'}
      }
    },

    sections = {
      lualine_a = {'mode'},
      lualine_b = {
        {
          'filename',

          path = 1,
          file_status = false,
          newfile_status = false,

          draw_empty = true,
          padding = { left = 1, right = 1 }
        },
        {
          'diagnostics',

          sections = {'error', 'warn', 'info', 'hint'},
          update_in_insert = true,

          draw_empty = true,
          padding = { left = 0, right = 1 }
        }
      },
      lualine_c = {}, 
      lualine_x = {'searchcount'},
      lualine_y = {
        function()
          return usage == nil and '' or table.concat({usage.today_minutes, ' Minute(s)'})
        end
      },
      lualine_z = {
        function()
          local hour = tostring(tonumber(os.date('%H')) % 12)
          local minute = os.date('%M')

          if hour:len() < 2 then
            hour = table.concat({'0', hour})
          end

          if minute:len() < 2 then
            minute = table.concat({'0', minute})
          end

          return table.concat({tonumber(os.date('%H')) > 12 and 'PM' or 'AM', ' ', hour, ':', minute})
        end
      }
    },
  })
end

return M
