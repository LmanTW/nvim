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
  "neovim/nvim-lspconfig",
  {
    "nvim-treesitter/nvim-treesitter",

    config = function ()
      require('nvim-treesitter.configs').setup({
        autotag = {
          enable = true,
          trueenable_rename = true,
          enable_close = true,
          enable_close_on_slash = true
        }
      })
    end
  },
  {
    "williamboman/mason.nvim",

    dependencies = {'williamboman/mason-lspconfig.nvim'},

    config = true
  },
  {
    "https://git.sr.ht/~whynothugo/lsp_lines.nvim",

    config = true
  },

  -- Auto Complete
  {
    'hrsh7th/nvim-cmp',

    dependencies = {'hrsh7th/cmp-nvim-lsp', 'hrsh7th/cmp-buffer', 'onsails/lspkind.nvim'}
  },
  {
    'dcampos/cmp-snippy',

    dependencies = {'dcampos/nvim-snippy'}
  },
  {
    "Exafunction/codeium.nvim",

    dependencies = {'nvim-lua/plenary.nvim'},

    config = true
  },

  -- Editing
  {
    'windwp/nvim-autopairs',

    event = 'InsertEnter',

    config = true
  },
  {
    'windwp/nvim-ts-autotag',

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

				view = {
          width = 25
				},

        git = {
          enable = true,
          ignore = false
        }
      })
    end
  },
  {
    'nvim-telescope/telescope.nvim',

    dependencies = {'nvim-lua/plenary.nvim'},

    config = function ()
      require('telescope').setup({

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

    dependencies = {'nvim-tree/nvim-web-devicons'},

    event = { "BufEnter" },

    config = function ()
      require('lualine').setup({
        options = {
          component_separators = { left = ' ', right = ' '},
          section_separators = { left = ' |', right = '| '},

          theme = 'nightfly'
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
        open_mapping = [[<c-t>]],
				size = 15
			})
		end
	},
  {
    'CRAG666/code_runner.nvim',

    config = function ()
      require('code_runner').setup({ mode = 'term' })
    end
  }
})
