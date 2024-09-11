-- Telescope settings. I like my telescope to be bigger so I use these.
M = {}

local previewers = require "telescope.previewers"
local sorters = require "telescope.sorters"

-- Set the options here
M.opts = {
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
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  }
}


-- Searches for config files
function M.find_config_files(opts)
  local builtin = require "telescope.builtin"
  local themes = require "telescope.themes"
  opts = opts or {}
  local theme_opts = themes.get_ivy {
    sorting_strategy = "ascending",
    layout_strategy = "bottom_pane",
    prompt_prefix = ">> ",
    prompt_title = "Search Config Files",
    cwd = "~/.config/nvim",
    search_dirs = { "~/.config/nvim" },
  }
  opts = vim.tbl_deep_extend("force", theme_opts, opts)
  builtin.find_files(opts)
end

-- Greps the config file
function M.grep_config_files(opts)
  local builtin = require "telescope.builtin"
  local themes = require "telescope.themes"
  opts = opts or {}
  local theme_opts = themes.get_ivy {
    sorting_strategy = "ascending",
    layout_strategy = "bottom_pane",
    prompt_prefix = ">> ",
    prompt_title = "Search in Config",
    cwd = "~/.config/nvim",
    search_dirs = { "~/.config/nvim"},
  }
  opts = vim.tbl_deep_extend("force", theme_opts, opts)
  builtin.live_grep(opts)
end

-- Smart little function to find git files if in a git project,
-- otherwise call the normal finder
function M.find_project_files(opts)
  local builtin = require "telescope.builtin"
  opts = opts or {}
  local ok = pcall(builtin.git_files, opts)

  if not ok then
    builtin.find_files(opts)
  end
end

-- Blah blah setup
function M.setup()

  local telescope = require("telescope")

  telescope.setup(M.opts)

  -- Load extensions here
  telescope.load_extension "projects"
  telescope.load_extension "fzf"

end

return M
