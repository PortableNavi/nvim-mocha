-- Basic Options and Settings
require("options")()


-- Plugins
local packerstrap = require("packerstrap")()
require("packer").startup(function(use)
    use "wbthomason/packer.nvim"
    use "nvim-tree/nvim-web-devicons"
    use "lewis6991/gitsigns.nvim"
    use "romgrk/barbar.nvim"
    use {"catppuccin/nvim", as = "catppuccin"}
    use "nvimdev/dashboard-nvim"
    use "nvim-lualine/lualine.nvim"
    use "nvim-tree/nvim-tree.lua"
    use "windwp/nvim-autopairs"
    use "lukas-reineke/indent-blankline.nvim"
    use "neovim/nvim-lspconfig"
    use "williamboman/mason.nvim"
    use "williamboman/mason-lspconfig.nvim"
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"
    use "dcampos/nvim-snippy"
    use "dcampos/cmp-snippy"
    use "honza/vim-snippets"
    use "Saecki/crates.nvim"
    use "nat-418/cmp-color-names.nvim"
    use "nvim-lua/plenary.nvim"
    use "nvim-telescope/telescope.nvim"

  if packerstrap then
    require("packer").sync()
  end
end)


-- Keybinds
require("keybinds")()


-- Tabs
require("tabs")()


-- Theme (Splashscreen, Colorscheme, Statusline, etc)
require("theme")()


-- Language Server
require("lsp")()

-- Autocomplete
require("completion")()


-- Autopairs
require("autopair")()


-- Misc
require("telescope").setup({})
