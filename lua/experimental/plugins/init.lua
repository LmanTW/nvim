local Keymaps = require('experimental.keymaps')

local M = {
  lazy_path = vim.fs.joinpath(vim.fn.stdpath('data'), '/lazy/lazy.nvim')
}

if not vim.loop.fs_stat(M.lazy_path) then
  vim.fn.system({
    'git', 'clone',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    '--filter=blob:none',
    M.lazy_path,
  })
end

vim.opt.rtp:prepend(M.lazy_path)

--- Setup The Plugins
--- @return nil
function M.setup()
end

require('lazy').setup({
  --- Colorscheme Manager
  {
    'lmantw/themify.nvim',

    config = function()
      require('experimental.plugins.themify').setup()
    end,

    lazy = false
  },

  --- Language Servers
  'neovim/nvim-lspconfig',
  {
    'williamboman/mason.nvim',

    dependencies = {'williamboman/mason-lspconfig.nvim'},

    config = function()
      require('experimental.plugins.mason').setup()
    end
  },
  {
    'sontungexpt/better-diagnostic-virtual-text',

    config = function()
      vim.diagnostic.config({ update_in_insert = true, virtual_text = false })

      require('better-diagnostic-virtual-text').setup({
        inline = false
      })

      vim.keymap.set({'n', 'i', 'v'}, '<C-z>', function()
        vim.diagnostic.enable(not vim.diagnostic.is_enabled())
      end)
    end,

    event = 'BufRead'
  },
  {
    'ray-x/lsp_signature.nvim',

    config = {
      max_height = 3,
      max_width = 50,

      hint_enable = false,

      close_timeout = 500
    },

    event = 'BufRead',
  },
  {
    'j-hui/fidget.nvim',

    config = {
      notification = {
      indow = {
          x_padding = 2,
          y_padding = 1
        }
      }
    },

    event = 'LspAttach'
  },

  --- Highlighting
  {
    'nvim-treesitter/nvim-treesitter',

    config = function()
      require('experimental.plugins.treesitter').setup()
    end,

    event = 'BufRead'
  },


  --- Completion
  {
    'hrsh7th/nvim-cmp',

    dependencies = {
      { 'hrsh7th/cmp-nvim-lsp', lazy = true },
      { 'hrsh7th/cmp-nvim-lsp-signature-help', lazy = true },
      { 'hrsh7th/cmp-buffer', lazy = true }
    },

    config = function()
      require('experimental.plugins.cmp').setup()
    end,

    event = 'BufRead'
  },
  {
    'Exafunction/codeium.nvim',

    config = {},

    event = 'BufRead'
  },

  --- Editing
  {
    'windwp/nvim-autopairs',

    config = true,

    event = 'InsertEnter'
  },
  {
    'windwp/nvim-ts-autotag',

    config = true,

    event = 'InsertEnter'
  },

  --- Scroll
  {
    'karb94/neoscroll.nvim',

	  config = function()
      local neoscroll = require('neoscroll')

      neoscroll.setup({
				hide_cursor = false,
				cursor_scrolls_alone = false,

        mappings = {}
      })

      vim.keymap.set({'n', 'i', 'v'}, '<D-Up>', function () neoscroll.scroll(-vim.wo.scroll, { move_cursor = true, duration = 500, easing = 'circular' }) end)
      vim.keymap.set({'n', 'i', 'v'}, '<D-Down>', function () neoscroll.scroll(vim.wo.scroll, { move_cursor = true, duration = 500, easing = 'circular' }) end)
		end
  },
  {
    'petertriho/nvim-scrollbar',

    config = true
  },

  --- Decorations
  {
    'romgrk/barbar.nvim',

    dependencies = {
      { 'nvim-tree/nvim-web-devicons', lazy = true }
    },

    config = function()
      vim.o.showtabline = 2

      require('barbar').setup({
        animation = false,

        icons = {
          filetype = {
            enabled = false
          }
        }
      })

      Keymaps.set_keymap({'n', 'i', 'v'}, '<A-Left>', ':BufferPrevious<CR>', 'i')
      Keymaps.set_keymap({'n', 'i', 'v'}, '<A-Right>', ':BufferNext<CR>', 'i')
      Keymaps.set_keymap({'n', 'i', 'v'}, '“', ':BufferMovePrevious<CR>', 'i')
      Keymaps.set_keymap({'n', 'i', 'v'}, '‘', ':BufferMoveNext<CR>', 'i')
      Keymaps.set_keymap({'n', 'i', 'v'}, '<A-Up>', ':BufferPrevious<CR>:BufferNext<CR>', 'i')
      Keymaps.set_keymap({'n', 'i', 'v'}, '<A-Down>', ':BufferDelete<CR>', 'i')
    end,

    event = 'BufRead'
  },
  {
    'nvim-lualine/lualine.nvim',

    config = function ()
      require('experimental.plugins.lualine')
    end,

    event = 'BufRead'
  },

  --- Media Explorer
  {
    'nvim-tree/nvim-tree.lua',

    config = function()
      require('nvim-tree').setup({
        sort_by = 'case_sensitive',

        filesystem_watchers = {
          debounce_delay = 100,
          ignore_dirs = {
            'node_modules'
          }
        },

        filters = {
          custom = {'.DS_Store'}
        },

        git = {
          enable = false
        },

        view = {
          width = 25
        },

        renderer = {
          icons = {
            show = {
              file = false,
              folder = false
            }
          }
        }
      })

      vim.keymap.set({'n', 'i', 'v'}, '<C-f>', '<ESC>:NvimTreeFocus<CR>')
    end
  },
  {
    'nvim-telescope/telescope.nvim',

    dependencies = {
      { 'nvim-lua/plenary.nvim', lazy = true }, 
    },

    init = function()
      vim.keymap.set({'n', 'i', 'v'}, '<C-g>', '<ESC>:Telescope find_files<CR>')
    end,

    config = function()
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = {
            'node_modules'
          }
        },

        pickers = {
          find_files = {
            disable_devicons = true
          }
        }
      })
    end,

    cmd = {'Telescope'}
  },

  --- Terminal
  {
    'akinsho/toggleterm.nvim',

		config = function()
      require('toggleterm').setup({
        open_mapping = '<C-t>',

				size = 15
			})
		end,

    event = 'BufRead'
	},
  {
    'CRAG666/code_runner.nvim',

    init = function()
      vim.keymap.set({'n', 'i', 'v'}, '<C-r>', '<ESC>:RunFile toggleterm<CR>')
    end,

    config = function()
      require('code_runner').setup({
        mode = 'term',

        filetype = {
          typescript = 'cd $dir && npm run start'
        }
      })
    end,

    cmd = {'RunFile'}
  },

  --- Other
  {
    'iamcco/markdown-preview.nvim',

    build = 'cd app && npm install',

    init = function()
      vim.g.mkdp_filetypes = {'markdown'}
    end,

    ft = {'markdown'},
    cmd = {'MarkdownPreviewToggle', 'MarkdownPreview', 'MarkdownPreviewStop'},
  },
})

return M
