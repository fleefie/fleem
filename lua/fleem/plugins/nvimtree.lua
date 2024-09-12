-- NvimTree file browser
return {
  "nvim-tree/nvim-tree.lua",
  lazy = true,
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  opts = {
    renderer = {
      full_name = true,
      group_empty = true,
      indent_markers = {
        enable = true,
        inline_arrows = true,
        icons = {
          corner = "╰",
          edge = "│",
          item = "│",
          bottom = "─",
          none = " ",
        },
      },
      icons = {
        git_placement = "before",
        show = {
          file = true,
          folder = true,
          folder_arrow = true,
          git = true,
        },
        glyphs = {
          git = {
            unstaged = "✗",
            staged = "✓",
            unmerged = "",
            renamed = "➜",
            untracked = "U",
            deleted = "-",
            ignored = "◌",
          }
        }
      },
    },
    sync_root_with_cwd = true,
    respect_buf_cwd = true,
    update_focused_file = {
      enable = true,
      update_root = true,
      ignore_list = { "help" },
    },
    diagnostics = {
      enable = true,
      show_on_dirs = false,
      icons = {
        error = '✘',
        warning = '▲',
        info = '»',
        hint = "󰌶",
      },
    },
    filters = {
      custom = {
        "^.git$",
      },
    },
    actions = {
      change_dir = {
        enable = false,
        restrict_above_cwd = true,
      },
      open_file = {
        resize_window = true,
        window_picker = {
          chars = "aoeui",
        },
      },
      remove_file = {
        close_window = false,
      },
    },
  }
}
