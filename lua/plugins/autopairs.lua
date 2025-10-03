return {
  "windwp/nvim-autopairs",
  event = "InsertEnter", -- Triggered when entering insert mode
  opts = {
    disable_filetype = { "TelescopePrompt", "vim" }, -- Disable autopairs for these filetypes
    check_ts = true, -- Enable Tree-sitter integration for better pair detection
    ts_config = {
      lua = { "string", "source" },
      javascript = { "template_string" },
    },
    fast_wrap = {
      map = "<M-e>",
      chars = { "{", "[", "(", '"', "'" },
      pattern = [=[[%'%"%>%]%)%}%,]]=],
      end_key = "$",
      before_key = "h",
      after_key = "l",
      cursor_pos_before = true,
      keys = "qwertyuiopzxcvbnmasdfghjkl",
      manual_position = true,
      highlight = "Search",
      highlight_grey = "Comment",
    },
  },
}
