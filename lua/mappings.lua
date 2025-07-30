require "nvchad.mappings"
local map = vim.keymap.set

-- Copilot
map("i", "<C-l>", function()
    vim.fn.feedkeys(vim.fn["copilot#Accept"](), "")
end, { desc = "Copilot Accept", noremap = true, silent = true })

-- General
map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>", { desc = "Exit insert mode" })

-- LSP Actions
map("n", "<leader>ca", vim.lsp.buf.code_action, { desc = "Code Action" })
map("n", "<leader>fr", ":Telescope lsp_references<CR>", { desc = "Find References" })
map("n", "gd", ":lua vim.lsp.buf.definition()<CR>", { desc = "Go to Definition" })
map("n", "<C-LeftMouse>", ":lua vim.lsp.buf.definition()<CR>", { desc = "Cmd+Click Definition" })

-- Search and Replace (Spectre)
map("n", "<leader>sr", ":Spectre<CR>", { desc = "Search and Replace (Project-Wide)" })

-- Git (Gitsigns)
map("n", "<leader>gs", ":Gitsigns stage_hunk<CR>", { desc = "Stage Hunk" })
map("n", "<leader>gr", ":Gitsigns reset_hunk<CR>", { desc = "Reset Hunk" })
map("n", "<leader>gb", ":Gitsigns blame_line<CR>", { desc = "Blame Line" })
map("n", "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", { desc = "Toggle Inline Blame" })
map("n", "<leader>gn", ":Gitsigns next_hunk<CR>", { desc = "Next Hunk" })
map("n", "<leader>gp", ":Gitsigns prev_hunk<CR>", { desc = "Previous Hunk" })
map("n", "<leader>gd", ":Gitsigns diffthis<CR>", { desc = "Diff This File (Index)" })
map("n", "<leader>gm", ":Gitsigns diffthis origin/main<CR>", { desc = "Diff This File (origin/main)" })
map("n", "<leader>gh", ":Gitsigns diffthis HEAD^<CR>", { desc = "Diff This File (HEAD^)" })

-- Diffview
map("n", "<leader>dv", ":DiffviewOpen<CR>", { desc = "Open Git Diff View" })
map("n", "<leader>dh", ":DiffviewFileHistory %<CR>", { desc = "File History" })
map("n", "<leader>dr", ":DiffviewOpen origin/main...HEAD<CR>", { desc = "Diff with Remote (origin/main)" })
map("n", "<leader>df", ":DiffviewOpen origin/main -- %<CR>", { desc = "Diff Current File with Remote" })
map("n", "<leader>dp", ":DiffviewOpen HEAD^ HEAD<CR>", { desc = "Diff with Previous Commit" })
map("n", "<leader>dc", ":DiffviewOpen HEAD^ -- %<CR>", { desc = "Diff Current File with Previous Commit" })
