return function()
    require("statusline")()
    require("sidebar")()

    require("catppuccin").setup({
        flavour="mocha",
        integrations = {
            cmp = true,
            gitsigns = true,
            barbar = true,
            treesitter = true,
            dashboard = true,
            lualine = false,
            nvimtree = true,
        },
    })
    vim.cmd.colorscheme "catppuccin"

    require("dashboard").setup({
        theme = "hyper",
        hide = {statusline=true, tabline=true, winbar=true},
        config = {
        week_header = {
            enable = true,
        },
        shortcut = {
            { desc = '󰊳 Update', group = '@property', action = 'PackerSync', key = 'u' },
            {
              icon = ' ',
              icon_hl = '@variable',
              desc = 'Files',
              group = 'Label',
              action = 'Telescope find_files',
              key = 'f',
            },
            {
              desc = ' Apps',
              group = 'DiagnosticHint',
              action = 'Telescope app',
              key = 'a',
            },
            {
              desc = ' dotfiles',
              group = 'Number',
              action = 'Telescope dotfiles',
              key = 'd',
            },
            },
        },
    })

    require("ibl").setup({
        exclude = {
            filetypes = {
                "lspinfo",
                "packer",
                "checkhealth",
                "help",
                "man",
                "gitcommit",
                "TelescopePrompt",
                "TelescopeResults",
                "dashboard",
                "",
            },
            buftypes = {
                "terminal",
                "nofile",
                "quickfix",
                "prompt",
            },
        }
    })
end 
