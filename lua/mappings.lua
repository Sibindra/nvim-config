require "nvchad.mappings"

local map = vim.keymap.set

map("i", "<C-l>", function()
    vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", noremap = true, silent = true })

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>fr", ":lua vim.lsp.buf.references()<CR>", { desc = "Find References" })
map("n", "<C-LeftMouse>", ":lua vim.lsp.buf.definition()<CR>", { desc = "Cmd+Click Definition" })
