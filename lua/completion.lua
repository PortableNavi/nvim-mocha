return function()
    local kind_icons = {
        Text = "󰉿",
        Method = "󰆧",
        Function = "󰊕",
        Constructor = "",
        Field = " ",
        Variable = "󰀫",
        Class = "󰠱",
        Interface = "",
        Module = "",
        Property = "󰜢",
        Unit = "󰑭",
        Value = "󰎠",
        Enum = "",
        Keyword = "󰌋",
        Snippet = "",
        Color = "󰏘",
        File = "󰈙",
        Reference = "",
        Folder = "󰉋",
        EnumMember = "",
        Constant = "󰏿",
        Struct = "",
        Event = "",
        Operator = "󰆕",
        TypeParameter = " ",
        Misc = " ",
    }

    local check_backspace = function()
        local col = vim.fn.col "." - 1
        return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
    end

    require("snippy").setup({
        mappings = {
            is = {
                ["<Tab>"] = "expand_or_advance",
                ["<S-Tab>"] = "previous",
            },

            nx = {
                ["<A-x>"] = "cut_text"
            }
        }
    })

    require("crates").setup({src = {cmp={enabled=true}}})
    require("cmp-color-names").setup()

    local cmp = require("cmp")
    cmp.setup({
        snippet = {
            expand = function(args)
                requrie("snippy").expand_snippet(args.body)
            end
        },

        mapping = {
            ["<C-Up>"] = cmp.mapping.select_prev_item(),
            ["<C-Down"] = cmp.mapping.select_next_item(),
            ["<C-S-Down>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
            ["<C-S-Up>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            ["<C-e>"] = cmp.mapping {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            },
            -- Accept currently selected item. If none selected, `select` first item.
            -- Set `select` to `false` to only confirm explicitly selected items.
            ["<CR>"] = cmp.mapping.confirm { select = true },
        },

        formatting = {
            fields = { "kind", "abbr", "menu" },
            format = function(entry, vim_item)
              -- Kind icons
              vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
              -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
              vim_item.menu = ({
                nvim_lsp = "[LSP]",
                luasnip = "[Snippet]",
                buffer = "[Buffer]",
                path = "[Path]",
              })[entry.source.name]
              return vim_item
            end,
        },

        sources = {
            { name = "nvim_lsp" },
            { name = "snippy" },
            { name = "buffer" },
            { name = "path" },
            {name = "crates"},
            {name="color_names"}
        },

        confirm_opts = {
            behavior = cmp.ConfirmBehavior.Replace,
            select = false,
        },

        window = {
            documentation = {
                border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
            },
        },

        experimental = {
            ghost_text = true,
            native_menu = false,
        },
    })  
end
