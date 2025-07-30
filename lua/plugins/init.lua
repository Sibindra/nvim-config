return {
    {
        "stevearc/conform.nvim",
        opts = require "configs.conform",
    },

    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },

    {
        "github/copilot.vim",
        lazy = false,
        config = function()
            vim.g.copilot_no_tab_map = true
            vim.g.copilot_assume_mapped = true
        end,
    },
    {
        "neovim/nvim-lspconfig",
        config = function()
            require "configs.lspconfig"
        end,
    },
    {
        "lewis6991/gitsigns.nvim",
        opts = {
            signs = {
                add = { text = "+" },
                change = { text = "~" },
                delete = { text = "_" },
                topdelete = { text = "‾" },
                changedelete = { text = "~" },
            },
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = "eol",
                delay = 100,
                ignore_whitespace = false,
                virt_text_priority = 100,
            },
            current_line_blame_formatter = function(name, blame_info, opts)
                if blame_info.author == name then
                    blame_info.author = "You"
                end
                if blame_info.sha == "0000000000" or not blame_info.author then
                    return { { "Not committed yet", "GitSignsBlame" } }
                end
                local date = os.date("%Y-%m-%d", blame_info.author_time)
                return {
                    {
                        string.format("%s • %s • %s", blame_info.author, date, blame_info.summary),
                        "GitSignsBlame",
                    },
                }
            end,
            diff_opts = {
                algorithm = "patience",
            },
        },
    },
    {
        "nvim-pack/nvim-spectre",
        cmd = "Spectre",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("spectre").setup {
                color_devicons = true,
                line_sep_start = "┌-----------------------------------------",
                result_padding = "¦  ",
                line_sep = "└-----------------------------------------",
                highlight = {
                    ui = "String",
                    search = "DiffChange",
                    replace = "DiffAdd",
                },
            }
        end,
    },
    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewFileHistory" },
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("diffview").setup {
                enhanced_diff_hl = true,
                view = {
                    default = {
                        layout = "diff2_horizontal",
                        winbar_info = true,
                    },
                    merge_tool = {
                        layout = "diff2_horizontal",
                        disable_diagnostics = true,
                    },
                },
                keymaps = {
                    view = {
                        ["<leader>c"] = ":DiffviewClose<CR>",
                    },
                },
            }
        end,
    },
    {
        "nvim-telescope/telescope.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        config = function()
            require("telescope").setup {
                defaults = {
                    mappings = {
                        i = {
                            ["<C-j>"] = "move_selection_next",
                            ["<C-k>"] = "move_selection_previous",
                        },
                    },
                },
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown(),
                    },
                },
            }
            local status, err = pcall(function()
                require("telescope").load_extension "octo"
            end)
            if not status then
                vim.notify("Failed to load octo Telescope extension: " .. err, vim.log.levels.ERROR)
            end
        end,
    },
    {
        "pwntester/octo.nvim",
        cmd = { "Octo" },
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-tree/nvim-web-devicons",
        },
        config = function()
            local ok, octo = pcall(require, "octo")
            if not ok then
                vim.notify("Failed to load octo.nvim: " .. octo, vim.log.levels.ERROR)
                return
            end
            octo.setup {
                suppress_missing_scope = {
                    projects_v2 = true,
                },
                mappings_disable_default = true,
                default_merge_method = "squash",
                picker = "telescope",
                enable_diagnostic = false,
                use_local_fs = true,
                default_remote = { "origin", "upstream" },
            }
        end,
    },
}
