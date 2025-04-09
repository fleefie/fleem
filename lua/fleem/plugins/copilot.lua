return {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    build = ":Copilot auth",
    event = "BufReadPost",
    opts = {
        suggestion = {
            enabled = true,
            auto_trigger = true,
            keymap = {
                accept = "<M-CR>",
                next = "<M-]>",
                prev = "<M-[>",
            },
        },
        panel = { enabled = false },
        filetypes = {
            markdown = true,
            help = true,
        },
    },
}
