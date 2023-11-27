return function()
  require("nvim-treesitter.configs").setup({
    ensure_installed = {"python", "lua", "rust", "json", "toml", "yaml", "java"},
    sync_install = false,
    ignore_install = {""},
    highlight = {
      enable = true,
      disable = {""},
      additional_vim_regex_highlighting = true,
    },
    indent = {enable= true, disable={"python", "java"}},
    rainbow={
      enable = true,
      extended_mode = true,
      max_file_lines = nil,
      colors = {
                "#89b4fa",
                "#89dceb",
                "#f9e2af",
                "#fab387",
                "#eba0ac",
                "#f38ba8",
                "#cba6f7",
            },
    },
  })
end
