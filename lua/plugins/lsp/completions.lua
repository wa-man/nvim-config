return {
    {
        "hrsh7th/cmp-nvim-lsp",
    },
    {
        "ray-x/cmp-treesitter",
    },
    {
        "hrsh7th/cmp-cmdline",
    },
    {
        "L3MON4D3/LuaSnip",
        dependencies = {
            "saadparwaiz1/cmp_luasnip",
            "rafamadriz/friendly-snippets",
        },
    },
    {
        "hrsh7th/nvim-cmp",
        config = function()
            require("config.plugins.lsp.autocompletions.cmp")
        end,
    },
}

