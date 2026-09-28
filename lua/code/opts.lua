do
    vim.diagnostic.config {
        severity_sort = true,
        float = { border = "rounded", source = "if_many"},
        underline = { severity = { min = vim.diagnostic.severity.WARN}},
        update_in_insert = true,

        virtual_text = true,
        virtual_lines = true,

        jump = {
            on_jump = function(_, bufnr)
               vim.diagnostic.open_float {
                 bufnr = bufnr,
                 scope = 'cursor',
                 focus = false,
               }
            end,
        },
    }
end
