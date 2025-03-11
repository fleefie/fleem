return {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    config = function()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        -- get the mason install path
        local install_path = require("mason-registry").get_package("jdtls"):get_install_path()
        -- local debug_install_path = require("mason-registry").get_package("java-debug-adapter"):get_install_path()
        local config = {
            cmd = {
                install_path .. "/bin/jdtls",
                "-Dlog.level=WARN"
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
