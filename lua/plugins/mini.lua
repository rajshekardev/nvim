vim.pack.add({
    "https://github.com/rafamadriz/friendly-snippets",
    "https://github.com/nvim-mini/mini.nvim",
})

local statusline = require("mini.statusline")
local MiniPick = require("mini.pick")
local Notify = require("mini.notify")
local cmdline = require("mini.cmdline")
local Extra = require("mini.extra")
local Completion = require("mini.completion")
local MiniSnippets = require("mini.snippets")

require("mini.surround").setup()
require("mini.ai").setup()

Notify.setup({
    content = {
        format = function(notif)
            return notif.msg
        end
    }
})

cmdline.setup({
    autocorrect = { enable = false }
})

statusline.setup { use_icons = vim.g.have_nerd_font }
statusline.section_location = function() return '%2l:%-2v' end

MiniPick.setup()
Extra.setup()

vim.keymap.set("n", "<leader>fs", function() MiniPick.builtin.grep_live() end, { desc = "Live grep" })
vim.keymap.set("n", "<leader>ff", function() MiniPick.builtin.files() end, {desc = "Mini File picker" })
vim.keymap.set("n", "<leader>fh", function() MiniPick.builtin.help() end, {desc = "Mini help"})

if vim.g.have_nerd_font then
  require('mini.icons').setup()
  MiniIcons.mock_nvim_web_devicons()
end

vim.keymap.set("n", "<leader>dd", function() Extra.pickers.diagnostic() end, { desc = "Mini diagnostics"})
vim.keymap.set("n", "<leader>fk", function() Extra.pickers.keymaps() end, { desc = "Search keymaps"})

Completion.setup({
    lsp_completion = {
        auto_setup = true,
        process_items = function(items, base)
            return Completion.default_process_items(items, base, {
                filtersort = "fuzzy"
            })
        end,
    }
})

MiniSnippets.setup({
    snippets = {
        MiniSnippets.gen_loader.from_lang(),
    },
    expand = {
        insert = function(snippet)
            MiniSnippets.default_insert(snippet, {empty_tabstop = "" })
        end,
    },
})

MiniSnippets.start_lsp_server({ match = false })

vim.api.nvim_create_autocmd("ColorScheme", {
    callback = function()
        vim.api.nvim_set_hl(0, "MiniSnippetsCurrent", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsCurrentReplace", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsFinal", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsUnvisited", {})
        vim.api.nvim_set_hl(0, "MiniSnippetsVisited", {})
    end,
})
