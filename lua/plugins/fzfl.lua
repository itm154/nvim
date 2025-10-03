local palette = require("catppuccin.palettes").get_palette()

return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    backend = "delta",
    backend_opts = {
      delta = {
        header_lines_to_remove = 4,
      },
      args = { "--line-numbers" }
    },

    winopts = {
      border   = function(_, m)
        if m.nwin == 1 then
          return { " ", " ", " ", " ", " ", " ", " ", " " }
        end
        if m.layout == "down" or m.layout == "up" then
          return { " ", " ", " ", " ", "", "", "", " " }
        end
        return { " ", " ", "", "", "", " ", " ", " " }
      end,
      preview  = {
        default = "bat",
        border = "solid",
        scrollbar = "float",
        scrolloff = "-1",
        title_pos = "center",
      },
      manpages = { previewer = "man_native" },
      helptags = { previewer = "help_native" },
      lsp      = { code_actions = { previewer = "codeaction_native" } },
      tags     = { previewer = "bat" },
      btags    = { previewer = "bat" },
    },
    hls = {
      title = "IncSearch",
    },
    fzf_colors = { true }
  }
}
