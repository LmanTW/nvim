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

-- Instal Plugins

require('lazy').setup({
  -- Theme
  {
    'folke/tokyonight.nvim',

    lazy = false,
    priority = 999,

    config = function ()
       vim.cmd[[colorscheme tokyonight-night]]
    end
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

    config = true
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

    event = 'BufEnter',

    config = true
  },

  -- Auto Complete
  {
    'hrsh7th/nvim-cmp',

    event = 'InsertEnter',

    dependencies = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'hrsh7th/cmp-nvim-lsp-signature-help', 'onsails/lspkind.nvim'},

    config = function ()
     require('configurations.experimental.plugins.cmp')
    end
  },
  {
    'dcampos/cmp-snippy',

    event = 'InsertEnter',

    dependencies = {'dcampos/nvim-snippy'}
  },
  {
    "Exafunction/codeium.nvim",

    event = 'InsertEnter',

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
          enable = false,

          -- ignore = false
        }
      })
    end
  },
  {
    'nvim-telescope/telescope.nvim',

    dependencies = {'nvim-lua/plenary.nvim'},

    config = function ()
      require('telescope').setup({})
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

    dependencies = {'nvim-tree/nvim-web-devicons'},

    config = function ()
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
          lualine_z = {'location'}
        },
      })
    end
  },

  -- Terminal
	{
    'akinsho/toggleterm.nvim',

		config = function ()
      require('toggleterm').setup({
        open_mapping = [[<C-t>]],

				size = 15
			})
		end
	},
  {
    'CRAG666/code_runner.nvim',

    config = function ()
      require('code_runner').setup({
        mode = 'term',

        filetype = {
          typescript = "npm run start",

          cs_harp = 'dotnet run',
          go = 'go run $dir/$fileName'
        }
      })
    end
  },

  -- Other
  'alec-gibson/nvim-tetris'
})

vim.cmd[[colorscheme tokyonight-night]]

vim.api.nvim_create_autocmd('CursorHoldI', {
  group = vim.api.nvim_create_augroup('cmp_complete_on_space', {}),
  callback = function()
    local line = vim.api.nvim_get_current_line()
    local cursor = vim.api.nvim_win_get_cursor(0)[2]

    if string.sub(line, cursor, cursor + 1) == " " then
      require("cmp").complete()
    end
  end,
})
