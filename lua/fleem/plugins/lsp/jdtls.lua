-- Java language server.
-- This is useful because this plugin provides WAY more features than
-- just using it as a regular LSP.

return {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
        local home_dir = os.getenv("HOME")
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- get the mason install path
        -- Using Mason here since it's just plain more convenient.
        -- Currently on Gentoo and there's no official jdtls ebuild so...
        local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
        -- local debug_install_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()
        local config = {
            cmd = {
                install_path .. "/bin/jdtls",
                "--jvm-arg=-javaagent:" .. home_dir .. "/.local/share/nvim/lsp_servers/jdtls/lombok.jar",
                "-Dlog.level=WARN",
            },
            capabilities = capabilities,
            root_dir = vim.fs.dirname(
                vim.fs.find({ ".gradlew", ".git", "mvnw", "pom.xml", "build.gradle", "build.xml" }, { upward = true })
                [1]
            ),
            handlers = {
                ['language/status'] = function(_, result)
                end,
                ['$/progress'] = function(_, result, ctx)
                end,
            },
        }
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "java", "jsp" },
            callback = function()
                require("jdtls").start_or_attach(config)
            end,
        })
    end,
}
