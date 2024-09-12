return {
  -- Alpha is the dashboard thingy
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "rubiin/fortune.nvim",
  },
  config = function()
    local alpha = require "alpha"
    local dashboard = require "alpha.themes.dashboard"

    local header = [[
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⠣⣀⠈⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⢸⡇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠛⠛⠻⠿⠿⠿⣿⣿⣿⣿⣿⣿⣿⡇⠀⡠⠃⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⣿⡇⠛⠛⠛⠛⠛⠛⠛⢻⡿⠁⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣴⣶⣶⣶⣶⣶⣶⣭⣥⣤⣤⣤⣤⣤⣤⣤⣬⣥⣤⣀⡀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣰⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⡀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢠⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⢟⣛⣒⣀
⠀⠀⠀⠀⠀⠀⠀⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⢫⣾⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣧⢻⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⠿⠁⠉⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡜⣿⣿⣿
⠀⠀⠀⠀⠀⠀⠀⡛⠻⣿⣿⣿⣿⠿⠇⠀⠀⠀⠘⢿⣿⣿⣿⣿⣿⣇⡛⠻⣿⣿⣿⣿⢿⣿⣿⢸⣿⣿
⠀⠀⠀⠀⠀⠀⢡⣿⣷⣶⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠙⠛⠛⠛⠛⠓⠂⠉⠙⠛⠃⠀⠀⢻⣿⣿
⠀⠀⠀⠀⠀⡈⣼⣿⣿⠇⢸⣟⠛⠇⠀⠀⠀⠀⠀⠀⠀⢶⡶⠶⢶⣦⡄⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿
⠀⠀⠀⠀⠶⢰⣿⡿⠏⠀⠸⢿⠏⠀⠀⠀⠀⠀⠀⠀⠀⠸⣇⣀⣾⠇⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿
⠀⠀⠀⠀⣤⣿⣿⠃⠀⠀⢀⣀⣠⡄⠐⠒⢲⣶⣤⡀⠀⠀⠉⠉⠁⠀⢠⣤⣤⣤⣄⠀⠀⠀⠀⢸⣿⣿
⠀⠀⠀⠀⣿⣿⡏⢀⣀⣴⣾⣿⣿⣧⣤⣤⣾⣿⣿⣷⣤⡀⠀⠀⠀⠀⠈⠙⠻⠿⠟⠀⠀⠀⠀⢸⣿⣿
⠀⠀⠀⢰⣿⣿⣿⢸⣿⣿⣏⡹⣿⣿⣿⣿⣿⣿⣿⢿⣿⣿⣷⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿
⠀⠀⠀⠘⣿⣿⣿⣆⡘⢿⣿⣿⣮⡻⠿⣿⡿⣛⣵⣿⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⣿⣿
⠀⠀⠀⠀⠀⠀⠛⠛⠃⠘⠿⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿
    ]]
    dashboard.section.header.val = vim.split(header, "\n")

    -- Menu buttons
    dashboard.section.buttons.val = {
      dashboard.button("f", "󰈞  Find files", "<cmd>Telescope find_files<cr>"),
      dashboard.button("r", "  Recent files", "<cmd>Telescope oldfiles<cr>"),
      dashboard.button("p", "  Projects", "<cmd>Telescope projects<CR>"),
      dashboard.button("n", "  New file", "<cmd>ene!<CR>"),
      dashboard.button("t", "󰊄  Find text", "<cmd>Telescope live_grep<cr>"),
      dashboard.button("u", "󱐥  Sync plugins", "<cmd>Lazy sync<CR>"),
      dashboard.button("m", "  Install language tools", "<cmd>Mason<CR>"),
      dashboard.button("x", "󰅖  Quit", "<cmd>qa<cr>"),
    }

    -- Fortune footer
    local fortune = require("fortune").get_fortune()
    dashboard.section.footer.val = fortune

    alpha.setup(dashboard.opts)

    vim.cmd([[autocmd FileType alpha setlocal nofoldenable]])
  end
}
