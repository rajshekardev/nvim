-- options
require("options.config")
require("options.commands")
require("options.keymap")

-- plugins
require("plugins.ui")
require("plugins.oil")
require("plugins.mini")
require("plugins.git")
require("plugins.misc")
require("plugins.tree")

-- code
require("code.lsp")

require("vim._core.ui2").enable({})
