return function()
    require("catppuccin").setup({
        flavour="mocha",
        integrations = {
            cmp = true,
            gitsigns = true,
            barbar = true,
            treesitter = true,
        },
    })
    vim.cmd.colorscheme "catppuccin"
end 
