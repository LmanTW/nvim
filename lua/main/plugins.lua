-- Install Lazy
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

vim.o.termguicolors = true

-- Instal Plugins

require('lazy').setup({
  {
    dev = true,

    dir = '/Users/lmantw/Desktop/Programming/themify.nvim',

    config = {
      {
        'folke/tokyonight.nvim',

        whitelist = {'tokyonight-night'}
      },
      {
        'sho-87/kanagawa-paper.nvim',

        branch = 'master'
      },
      {
        'Yazeed1s/minimal.nvim',

        whitelist = {'minimal-base16'}
      }
    }
  },

  -- LSP
  'neovim/nvim-lspconfig',
  {
    'nvim-treesitter/nvim-treesitter',

    config = function ()
      require('nvim-treesitter.configs').setup({
        highlight = {
          enable = true,
        },

        autotag = {
          enable = true,

          trueenable_rename = true,

          enable_close = true,
          enable_close_on_slash = true,

          filetypes = { 'html' }
        },
      })
    end
  },
  {
    'williamboman/mason.nvim',

    dependencies = {'williamboman/mason-lspconfig.nvim'},

    config = function()
      require('experimental.plugins.mason')
    end
  },
  {
    'https://git.sr.ht/~whynothugo/lsp_lines.nvim',

    event = 'BufReadPre',

    config = true
  },
  {
    'j-hui/fidget.nvim',

    config = function()
      require('fidget').setup({
        notification = {
          window = {
            normal_hl = "Comment",      -- Base highlight group in the notification window
            winblend = 100,             -- Background color opacity in the notification window
            border = "none",            -- Border around the notification window
            zindex = 45,                -- Stacking priority of the notification window
            max_width = 0,              -- Maximum width of the notification window
            max_height = 0,             -- Maximum height of the notification window
            x_padding = 2,              -- Padding from right edge of window boundary
            y_padding = 1,              -- Padding from bottom edge of window boundary
            align = "bottom",           -- How to align the notification window
            relative = "editor",        -- What the notification window position is relative to
          }
        }
      })
    end
  },

  -- Auto Complete
  {
    'hrsh7th/nvim-cmp',

    event = 'BufReadPre',

    dependencies = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp-signature-help', 'onsails/lspkind.nvim' },

    config = function ()
     require('configurations.experimental.plugins.cmp')
    end
  },
  {
    'dcampos/cmp-snippy',

    event = 'BufReadPre',

    dependencies = {'dcampos/nvim-snippy'}
  },
  {
    'Exafunction/codeium.nvim',

    event = 'BufReadPre',

    dependencies = {'nvim-lua/plenary.nvim'},

    config = true
  },

  -- Editing
  {
    'windwp/nvim-autopairs',

    event = 'BufReadPre',

    config = true
  },
  {
    'windwp/nvim-ts-autotag',

    event = 'BufReadPre',

    config = true
  },

  -- Scroll
  {
    'karb94/neoscroll.nvim',

	  config = function ()
		  require('neoscroll').setup({
				hide_cursor = false,
				cursor_scrolls_alone = false
			})
		end
  },
  {
    'petertriho/nvim-scrollbar',

    config = true
  },

  -- Media Explorer
  {
    'nvim-tree/nvim-tree.lua',

    dependencies = {'nvim-tree/nvim-web-devicons'},

    config = function ()
      require('nvim-tree').setup({
      	sort_by = 'case_sensitive',

        filesystem_watchers = {
          ignore_dirs = {
            'node_modules'
          }
        },

        filters = {
				  custom = { '.DS_Store' }
				},

				view = {
          width = 25
				},

        git = {
          enable = false
        }
      })
    end
  },
  {
    'nvim-telescope/telescope.nvim',

    dependencies = {'nvim-lua/plenary.nvim'},

    config = function ()
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = {
            "node_modules"
          },
        },
      })
    end
  },

  -- Tab
  {
    'romgrk/barbar.nvim',

    dependencies = {'nvim-tree/nvim-web-devicons'},

    config = function ()
      require('barbar').setup({
        animation = false
      })
    end
  },

  -- Status Line
  {
    'nvim-lualine/lualine.nvim',

    dependencies = {'nvim-tree/nvim-web-devicons', 'archibate/lualine-time'},

    config = function ()
      local function time ()
        local current_time = os.date('*t')

        local hour = current_time.hour
        local meridiem = 'AM'

        if hour > 12 then
          hour = hour - 12
          meridiem = 'PM'
        end

        return hour .. ':' .. current_time.min .. ' ' .. meridiem
      end

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
          lualine_z = { time }
        },
      })
    end
  },

  -- Terminal
	{
    'akinsho/toggleterm.nvim',

    event = 'BufReadPre',

		config = function ()
      require('toggleterm').setup({
        open_mapping = [[<C-t>]],

				size = 15
			})
		end
	},
  {
    'CRAG666/code_runner.nvim',

    event = 'BufReadPre',

    config = function ()
      require('code_runner').setup({
        mode = 'term',

        filetype = {
          typescript = 'npm run start',

          cs_harp = 'dotnet run',
          go = 'go run $dir/$fileName'
        }
      })
    end
  },

  -- Other 
  {
    'iamcco/markdown-preview.nvim',

    cmd = { 'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop' },

    build = 'cd app && yarn install',

    init = function()
      vim.g.mkdp_filetypes = { 'markdown' }
    end,

    ft = { 'markdown' },
  },
  {
    'gelguy/wilder.nvim',

    config = function()
      local wilder = require('wilder')

      wilder.setup({
        modes = { ':', '/' },

        next_key = '<Down>',
        previous_key = '<Up>',
        accept_key = '<Right>'
      })

      wilder.set_option('renderer', wilder.popupmenu_renderer(
        wilder.popupmenu_border_theme({
          highlights = { border = 'Normal', },
          highlighter = wilder.basic_highlighter(),

          border = 'rounded',
        })
      ))
    end
  },
  'alec-gibson/nvim-tetris',
  {
    'samodostal/image.nvim',

    dependencies = {'m00qek/baleia.nvim'},

    config = function()
      require('image').setup({
        render = {
          min_padding = 1,
          foreground_color = true,
          background_color = true
        }
      })
    end
  },
  {
    'folke/neodev.nvim',
    config = {}
  },
})

vim.api.nvim_create_autocmd('CursorHoldI', {
  group = vim.api.nvim_create_augroup('cmp_complete_on_space', {}),
  callback = function()
    local line = vim.api.nvim_get_current_line()
    local cursor = vim.api.nvim_win_get_cursor(0)[2]

    if string.sub(line, cursor, cursor + 1) == ' ' then
      require('cmp').complete()
    end
  end
})
