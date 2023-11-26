-- Basic Options and Settings
vim.opt.number = true       -- Show Line Numbers
vim.opt.mouse = "a"         -- Enable Mouse
vim.opt.ignorecase = true   -- Ignore case in searches
vim.opt.smartcase = true    -- Dont ignore case in searches if searchterm includes uppercase letter
vim.opt.hlsearch = false    -- Dont keep highlighting search results
vim.opt.wrap = false        -- Dont wrap
vim.opt.tabstop = 4         -- Default tabsize of 4
vim.opt.shiftwidth = 4      -- Tabsize of lineshifts
vim.opt.expandtab = true    -- convert tabs to spaces


-- Plugins
local packerstrap = require "packerstrap"
return require("packer").startup(function(use)
  use "wbthomason/packer.nvim"

  if packerstrap then
    require("packer").sync()
  end
end)

