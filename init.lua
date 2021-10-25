local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.cmd "packadd packer.nvim"
end

require("packer").startup(
  function(use)
    -- Plugin Manager
    use "wbthomason/packer.nvim"

    -- Syntax Highlighting
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "romgrk/nvim-treesitter-context"

    -- LSP
    use "neovim/nvim-lspconfig"
    use "williamboman/nvim-lsp-installer"
    use "simrat39/rust-tools.nvim"

    -- Status Line
    use "hoob3rt/lualine.nvim"
    use "akinsho/bufferline.nvim"

    -- Devicons
    use "kyazdani42/nvim-web-devicons"

    -- Formatter
    use "mhartington/formatter.nvim"

    -- Completion
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-nvim-lua",
        "octaltree/cmp-look",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-calc",
        "f3fora/cmp-spell",
        "hrsh7th/cmp-emoji",
        "hrsh7th/cmp-vsnip",
        "hrsh7th/vim-vsnip"
      }
    }

    -- Commenting
    use "scrooloose/nerdcommenter"

    -- Telescope
    use "nvim-lua/popup.nvim"
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/plenary.nvim"}}
    }

    -- Git
    use "f-person/git-blame.nvim"
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    }

    -- Misc. Language Plugins
    use "cespare/vim-toml"

    -- Themes
    use "EdenEast/nightfox.nvim"

    -- Lua Perf Plugins
    use "lewis6991/impatient.nvim"

    -- Debugger
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {}
      end
    }

    -- Presentation
    use "lukas-reineke/headlines.nvim"
    use {"ellisonleao/glow.nvim"}

    -- Misc. Plugins
    use "xiyaowong/nvim-transparent"
    use "brooth/far.vim"
    use {"akinsho/toggleterm.nvim"}
  end
)

require("impatient")
require("lspconfigrc")
require("completionrc")
require("settings")
require("keymapping")
require("filetypes")
require("telescoperc")
require("pluginsrc")
