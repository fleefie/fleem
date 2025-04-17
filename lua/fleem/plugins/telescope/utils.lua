-- Telescope utility functions. Yanked from lvim and reworked

M = {}

-- Searches for config files
function M.find_config_files(opts)
    local builtin = require "telescope.builtin"
    opts = opts or {}
    local theme_opts = {
        prompt_title = "Search Config Files",
        cwd = "~/.config/nvim",
        search_dirs = { "~/.config/nvim" }
    }
    opts = vim.tbl_deep_extend("force", theme_opts, opts)
    builtin.find_files(opts)
end

-- Greps the config file
function M.grep_config_files(opts)
    local builtin = require "telescope.builtin"
    opts = opts or {}
    local theme_opts = {
        prompt_title = "Search in Config",
        cwd = "~/.config/nvim",
        search_dirs = { "~/.config/nvim" },
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

return M
