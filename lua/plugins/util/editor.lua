return {
    -- specter
    -- flash
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        config = function()
            require("config.plugins.util.editor.flash")
        end,
    },
    -- which key
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        config = function()
            require("config.plugins.util.editor.whichkey")
        end,
    },
    -- inc rename
    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("config.plugins.util.editor.increname")
        end,
    },
    {
        "folke/flash.nvim",
        event = "VeryLazy",
        opts = {
            jump = {
                autojump = true,
            },
            modes = {
                char = {
                    jump_labels = true,
                    multi_line = false,
                },
            },
        },
        keys = {
            {
                "s",
                mode = { "n", "x", "o" },
                function()
                    require("flash").jump()
                end,
                desc = "Flash",
            },
            {
                "S",
                mode = { "n", "x", "o" },
                function()
                    require("flash").treesitter()
                end,
                desc = "Flash Treesitter",
            },
            {
                "r",
                mode = "o",
                function()
                    require("flash").remote()
                end,
                desc = "Remote Flash",
            },
            {
                "R",
                mode = { "o", "x" },
                function()
                    require("flash").treesitter_search()
                end,
                desc = "Treesitter Search",
            },
            {
                "<c-s>",
                mode = { "c" },
                function()
                    require("flash").toggle()
                end,
                desc = "Toggle Flash Search",
            },
        },
    },
    -- illuminate
    {
        "RRethy/vim-illuminate",
        opts = {
            delay = 200,
            large_file_cutoff = 2000,
            large_file_overrides = {
                providers = { "lsp" },
            },
        },
        config = function(_, opts)
            require("illuminate").configure(opts)

            local function map(key, dir, buffer)
                vim.keymap.set("n", key, function()
                    require("illuminate")["goto_" .. dir .. "_reference"](false)
                end, { desc = dir:sub(1, 1):upper() .. dir:sub(2) .. " Reference", buffer = buffer })
            end

            map("]]", "next")
            map("[[", "prev")

            -- also set it after loading ftplugins, since a lot overwrite [[ and ]]
            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    local buffer = vim.api.nvim_get_current_buf()
                    map("]]", "next", buffer)
                    map("[[", "prev", buffer)
                end,
            })
            require("illuminate").setup(opts)
        end,
        keys = {
            { "]]", desc = "Next Reference" },
            { "[[", desc = "Prev Reference" },
        }
    },
    -- trouble
    -- todo comments
    -- navic
}
