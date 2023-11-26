return function()
    vim.g.barbar_auto_setup = false

    require("barbar").setup
    {
        animation = true,
        autohide = false,
        clickable = true,
        highlight_visible = true,
        
        icons = {
            buffer_index = false,
            buffer_number = false,
            button = "",
            filetype = {enabled=true, custom_colors = false},
            gitsigns = {
                deleted = {enabled = true, icon = ''},
                changed = {enabled = true, icon = ''},
                added = {enabled = true, icon = ''},
            },
            no_name_title = "Scratch",
        }
    }
end 
