-- Telescope!
return {
  "nvim-telescope/telescope.nvim",
  lazy = false,
  cmd = "Telescope",
  dependencies = {
    "nvim-telescope/telescope-ui-select.nvim",
    "telescope-fzf-native.nvim",
    "nvim-telescope/telescope-project.nvim"
  },
  setup = function()
    local telescope = require("telescope")

    local previewers = require "telescope.previewers"
    local sorters = require "telescope.sorters"

    -- Set the options here
    local opts = {
      file_previewer = previewers.vim_buffer_cat.new,
      grep_previewer = previewers.vim_buffer_vimgrep.new,
      qflist_previewer = previewers.vim_buffer_qflist.new,
      file_sorter = sorters.get_fuzzy_file,
      generic_sorter = sorters.get_generic_fuzzy_sorter,

      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          horizontal = {
            preview_width = 0.6,
            preview_cutoff = 75,
            width = 0.8,
            height = 0.8,
            prompt_position = "bottom"
          },
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,                   -- false will only do exact matching
          override_generic_sorter = true, -- override the generic sorter
          override_file_sorter = true,    -- override the file sorter
          case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
          -- the default case_mode is "smart_case"
        },
      }
    }

    telescope.setup(opts)

    -- Load extensions here
    telescope.load_extension "projects"
    telescope.load_extension "fzf"
  end
}
