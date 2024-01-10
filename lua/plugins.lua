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

require('lazy').setup({
	{
		'm4xshen/autoclose.nvim',
	  config = true
	},
  {
    'nvim-treesitter/nvim-treesitter',
    config = function()
      require('nvim-treesitter.configs').setup({
        auto_install = true,

        ensure_installed = {
          'css',
          'html',
        },

        highlight = {
          enable = true,
          use_languagetree = true,
        },

        autotag = {
          enable = true,
          filetypes = { 'html', 'vue' }
        },

        indent = { enable = true },
      })
    end
  },
  'windwp/nvim-ts-autotag',

	-- Theme
  {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    config = function()
	    vim.cmd([[colorscheme tokyonight-night]])
		end
  },

	-- Nvim Tree
	{
    'nvim-tree/nvim-tree.lua',
		config = function()
		  require('nvim-tree').setup({
      	sort_by = 'case_sensitive',
				view = {
          width = 25
				},
				filters = {
				  custom = { '.DS_Store' }
				},
        git = {
          enable = true,
          ignore = false
        },
				log = {
          enable = true,
          truncate = true,
         types = {
            diagnostics = true,
          }
        },
				diagnostics = {
    	    enable = true,
  			}
			})
		end
	},
	'nvim-tree/nvim-web-devicons',

  -- Telescope
  {
    'nvim-telescope/telescope.nvim',
    config = function()
      require('telescope').setup({
        find_files = {
          theme = 'dropdown',
        }
      })
    end
  },

	-- Auto Complete
	'neovim/nvim-lspconfig',
	'williamboman/mason.nvim',
	'williamboman/mason-lspconfig.nvim',
	'hrsh7th/nvim-cmp',
	'hrsh7th/cmp-nvim-lsp',
  'L3MON4D3/LuaSnip',
	{
    'Exafunction/codeium.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim'
    },
    config = true
	},
  'onsails/lspkind.nvim',

  -- Tabs
	{
    'romgrk/barbar.nvim',
	  config = function()
		  require('barbar').setup({
				animation = false,
				icons = {
					diagnostics = {
      			[vim.diagnostic.severity.ERROR] = { enabled = true, icon = '' },
      			[vim.diagnostic.severity.WARN] = { enabled = true, icon = '' },
      			[vim.diagnostic.severity.INFO] = { enabled = false },
      			[vim.diagnostic.severity.HINT] = { enabled = false },
    			}
				}
			})
		end
	},

	-- Terminal
	{
    'akinsho/toggleterm.nvim',
		config = function()
      require('toggleterm').setup({
        open_mapping = [[<c-t>]],
				size = 15
			})
		end
	},

	-- Others
	{
		'samodostal/image.nvim',
		dependencies = {
			'm00qek/baleia.nvim'
		},
		config = function()
			require('image').setup({
				render = {
					min_padding = 1,
					show_label = true,
					show_image_dimensions = true,
					use_dither = false,
					foreground_color = true,
					background_color = true
				},
    		events = {
					update_on_nvim_resize = true
				}
			})
		end
	},
  {
    'CRAG666/code_runner.nvim',
		config = function()
			require('code_runner').setup({
        mode = 'term',
        filetype = {
          go = 'go run $dir/$fileName'
        },
			})
		end
	},
	{
    'petertriho/nvim-scrollbar',
		config = true
	},
	{
    'karb94/neoscroll.nvim',
		config = function()
		  require('neoscroll').setup({
				hide_cursor = false,
				cursor_scrolls_alone = false
			})
		end
  },
	{
		'LunarVim/bigfile.nvim',
		config = function ()
			require('bigfile').setup({
				filesize = 2,
				pattern = { '*' }
			})
		end
	}
})
