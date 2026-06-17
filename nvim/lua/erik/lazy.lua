-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Handle SSL certificate verification issues for pip under proxy/VPN networks (e.g. for python-lsp-server)
vim.env.PIP_TRUSTED_HOST = "pypi.org pypi.python.org files.pythonhosted.org"

-- Setup lazy.nvim with the translated plugin specs
require("lazy").setup({
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },

  {
    "ellisonleao/gruvbox.nvim",
    priority = 1000, -- Load this first as it is our colorscheme
  },

  "justinmk/vim-sneak",

  "nvim-tree/nvim-tree.lua",

  "nvim-tree/nvim-web-devicons",

  "tpope/vim-commentary",

  "machakann/vim-highlightedyank",

  "liuchengxu/vim-which-key",

  "tpope/vim-fugitive",

  {
    "RRethy/vim-illuminate",
    config = function()
      require('illuminate').configure({
        under_cursor = true,
      })
    end
  },

  {
    "kylechui/nvim-surround",
    version = "*",
    config = function()
      require("nvim-surround").setup({})
    end
  },

  {
    'nvim-lualine/lualine.nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' }
  },

  {
    'VonHeikemen/fine-cmdline.nvim',
    dependencies = { 'MunifTanjim/nui.nvim' }
  },

  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  "mbbill/undotree",

  {
    "Pocco81/auto-save.nvim",
    config = function()
      require("auto-save").setup({})
    end,
  },

  {
    'williamboman/mason.nvim',
    config = function()
      require("mason").setup()
    end
  },

  {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim' },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = { "omnisharp", "pylsp", "yamlls", "bashls", "cssls", "html", "jsonls", "ts_ls", "lua_ls", "rust_analyzer" },
        automatic_installation = true,
      }
    end
  },

  -- LSP Support
  'neovim/nvim-lspconfig',

  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-path',
      'hrsh7th/cmp-nvim-lua',
      'L3MON4D3/LuaSnip',
    }
  },

  "nvim-lua/plenary.nvim",

  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" }
  },

  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('treesitter-context').setup {
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
  },

  {
    "windwp/nvim-autopairs",
    event = "InsertEnter",
    config = function()
      require("nvim-autopairs").setup({})
    end
  }
})
