return {
    {
        -- Color scheme
        "catppuccin/nvim", 
        priority = 1000,
        name = "catppuccin", 
        config = function()
            -- mocha, frappe, latte, macchiato
            vim.cmd("colorscheme catppuccin-mocha")
        end,
    },
}