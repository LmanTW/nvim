local M = {}

--- Setup LuaLine
--- @return nil
function M.setup()
  require('lualine').setup({
    options = {
      component_separators = { left = ' ', right = ' '},
      section_separators = { left = ' |', right = '| '},
 
      theme = 'nightfly',
 
      disabled_filetypes = { 'NvimTree' }
    },
 
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'filename'},
      lualine_c = {'diagnostics'},
      lualine_x = {'encoding'},
      lualine_y = {},
      lualine_z = {function()
        local current_time = os.date('*t')
        local hour = current_time.hour

        return table.concat({math.fmod(hour, 12), ':', current_time.min, ' ', hour > 12 and 'pm' or 'am'})
      end}
    }
  })
end

return M
