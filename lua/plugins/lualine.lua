return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons", "bwpge/lualine-pretty-path" },
  event = "VeryLazy",
  config = function()
    require("lualine").setup({
      options = {
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = {},
      },
      sections = {
        lualine_a = {
          { "mode", separator = { left = "", right = "" }, icon = "" },
        },
        lualine_b = { "pretty_path" },
        lualine_c = {},
        lualine_x = {
          {
            "diagnostics",
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
            update_in_insert = true,
          },
        },
        lualine_y = {
          { "branch", icon = "" },
          {
            "diff",
            symbols = { added = " ", modified = " ", removed = " " },
            colored = true,
          },
        },
        lualine_z = {
          { "location", separator = { left = "", right = "" }, icon = "" },
        },
      },
      inactive_sections = {
        lualine_a = { "filename" },
        lualine_b = { "pretty_path" },
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = { "location" },
      },
      extensions = { "trouble" },
    })
  end,
}
