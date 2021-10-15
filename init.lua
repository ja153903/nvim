local fn = vim.fn
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({"git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path})
  vim.cmd "packadd packer.nvim"
end

require("packer").startup(
  function(use)
    -- Essential plugins
    use "wbthomason/packer.nvim"
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "romgrk/nvim-treesitter-context"
    use "neovim/nvim-lspconfig"
    use "hoob3rt/lualine.nvim"
    use "kyazdani42/nvim-web-devicons"
    use "glepnir/lspsaga.nvim"
    use "mhartington/formatter.nvim"
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-nvim-lsp",
        "quangnguyen30192/cmp-nvim-ultisnips",
        "hrsh7th/cmp-nvim-lua",
        "octaltree/cmp-look",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-calc",
        "f3fora/cmp-spell",
        "hrsh7th/cmp-emoji",
        "SirVer/ultisnips"
      }
    }
    -- Formatting
    use "scrooloose/nerdcommenter"
    -- Telescope
    use "nvim-lua/popup.nvim"
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/plenary.nvim"}}
    }
    -- git
    use "f-person/git-blame.nvim"
    use "pantharshit00/vim-prisma"
    use "jparise/vim-graphql"
    use "cespare/vim-toml"
    -- themes
    use "EdenEast/nightfox.nvim"
    use "folke/tokyonight.nvim"
    -- integrated terminal
    use "voldikss/vim-floaterm"
    -- opt
    use "lewis6991/impatient.nvim"
    -- transparency
    use "xiyaowong/nvim-transparent"
    -- buffer
    use "akinsho/bufferline.nvim"
    -- debugging protocol
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"}}
    use {
      "lewis6991/gitsigns.nvim",
      requires = {
        "nvim-lua/plenary.nvim"
      }
    }
    -- presentation related tools
    use "kristijanhusak/orgmode.nvim"
    use "lukas-reineke/headlines.nvim"
  end
)

require("impatient")
require("colors")
require("settings")
require("keymapping")
require("lspconfigrc")
require("filetypes")
require("telescoperc")
require("pluginsrc")
require("completionrc")
