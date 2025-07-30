require "nvchad.options"

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4

vim.diagnostic.config {
    virtual_text = {
        prefix = "●",
        source = "always",
        format = function(diagnostic)
            return string.format("%s: %s", diagnostic.source, diagnostic.message)
        end,
    },
    signs = true,
    underline = true,
    update_in_insert = false,
    severity_sort = true,
}

local o = vim.o
o.cursorlineopt = "both"
