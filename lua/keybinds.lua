return function()
    local map = vim.api.nvim_set_keymap
    local opts = {noremap=true, silent=true}
    local eopts = {noremap=true, silent=true, expr=true}


    -- Indentation Tab / Shift-Tab
    map("v", "<tab>", ">gv", opts)
    map("v", "<S-tab>", "<gv", opts)

    -- Cancel Search Highlighting
    map("n", "<C-7>", ":nohlsearch<Bar>:echo<CR>", opts)

    -- Window Navigation Ctrl-ArrowKeys
    map("n", "<C-Left>", "<C-w>h", opts)
    map("n", "<C-Down>", "<C-w>j", opts)
    map("n", "<C-Up>", "<C-w>k", opts)
    map("n", "<C-Right>", "<C-w>l", opts)

    -- Window Arrangement Shift+Alt+ArrowKeys to resize focused window
    map("n", "<S-C-Up>", ":resize -2<CR>", opts)
    map("n", "<S-C-Down>", ":resize +2<CR>", opts)
    map("n", "<S-C-Left>", ":vertical resize -2<CR>", opts)
    map("n", "<S-C-Right>", ":vertical resize +2<CR>", opts)

    -- Add window on the right Alt+h
    map("n", "<A-h>", ":vsplit<CR>", opts)

    -- Add Window below Alt+v
    map("n", "<A-v>", ":split<CR>", opts)

    -- Close Window Alt+w
    map("n", "<A-w>", ":BufferClose<CR><C-w>q", opts)
    map("n", "<S-A-w>", "<C-w>q", opts)
    map("i", "<S-A-w>", "<ESC><C-w>q", opts)

    -- Toggle explorer with Alt+f
    map("n", "<A-f>", ":NvimTreeToggle<CR>", opts)
    map("i", "<A-f>", "<ESC>:NvimTreeToggle<CR>i", opts)

    -- Switch buffer Ctrl+Alt+Left/Right
    map("n", "<A-Right>", ":BufferNext<CR>", opts)
    map("n", "<A-Left>", ":BufferPrevious<CR>", opts)

    -- Cut/Copy/Duplicate Line Ctrl+x/c/d
    map("i", "<C-x>", "<ESC>ddi", opts)
    map("i", "<C-c>", "<ESC>yyi", opts)
    map("i", "<C-d>", "<ESC>yypi", opts)

    -- Cut/Copy/Duplicate Selection Ctrl+x/c/d
    map("v", "<C-x>", "di", opts)
    map("v", "<C-c>", "yi", opts)
    map("v", "<C-d>", "ypi", opts)

    -- Paste Ctrl+v
    map("i", "<C-v>", "<ESC>pi", opts)
    map("v", "<C-v>", '"_dP', opts)

    -- Save Ctrl+s
    map("n", "<C-s>", ":wall<CR>", opts)
    map("i", "<C-s>", "<ESC>:wall<CR>i<Right>", opts)

    -- Undo/Redo Ctrl+u/Ctlr+r
    map("i", "<C-u>", "<ESC>:undo<CR>i", opts)
    map("i", "<C-r>", "<ESC>:redo<CR>i", opts)

    -- Finder Ctrl+f
    map("n", "<C-f>", ":Telescope find_files<CR>", opts)
    map("n", "<C-g>", ":Telescope live_grep<CR>", opts)
    map("n", "<C-h>", ":Telescope man_pages<CR>", opts)

    -- Toogle Terminal Ctrl-T
    map("n", "<C-t>", ":ToggleTerm<CR>", opts)
    map("i", "<C-t>", "<ESC>:ToggleTerm<CR>i", opts)
    map("t", "<C-t>", "<ESC>:ToggleTerm<CR>i", opts)

    -- Open file Ctrl+o
    map("n", "<C-o>", ":e ", opts)
end

-- Tab Complete Navigation
    -- Navigate Suggestion List:    Ctrl-Up/Down
    -- Next Suggestion:             Tab
    -- Complete:                    Ctrl-Space
    -- Close Autocomplete Window:   Ctrl-e

-- Sidebar Navigation
    -- Create a new File/Folder:    a
    -- Copy, Cut, Paste:            c, x, p
    -- Rename:                      r
    -- Open/Close Folder:           Enter

