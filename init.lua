-- General options
require("fleem.settings.commands").nvim()
require("fleem.settings.mappings").nvim()
require("fleem.settings.options").nvim()

-- Load Lazy
require("fleem.lazy")

-- Load post-lazy commands. Avoid these like the plague!
require("fleem.lazy_after")
