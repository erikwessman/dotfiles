-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }

  use { "ellisonleao/gruvbox.nvim" }

  use "nvim-tree/nvim-tree.lua"

  use "nvim-tree/nvim-web-devicons"

  use { "tpope/vim-commentary" }

  use "machakann/vim-highlightedyank" 

  use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; omit to use `main` branch for the latest features
        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
            })
        end
    })

  use "liuchengxu/vim-which-key"

  use {
      'nvim-lualine/lualine.nvim',
      requires = { 'nvim-tree/nvim-web-devicons', opt = true }
  }

  use {
      'VonHeikemen/fine-cmdline.nvim',
      requires = {
          {'MunifTanjim/nui.nvim'}
      }
  }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

  use("mbbill/undotree")

  use({
      "Pocco81/auto-save.nvim",
      config = function()
          require("auto-save").setup {
              -- your config goes here
              -- or just leave it empty :)
          }
      end,
  })

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }

  use {
    'nvim-treesitter/nvim-treesitter-context',
    requires = {'nvim-treesitter/nvim-treesitter'}, -- This line ensures that nvim-treesitter is installed as a dependency
    config = function()
      require'treesitter-context'.setup{
        enable = true,
        max_lines = 0,
        min_window_height = 0,
        line_numbers = true,
        multiline_threshold = 20,
        trim_scope = 'outer',
        mode = 'cursor',
        separator = '-',
        zindex = 20,
        on_attach = nil,
      }
    end
  }

end)
