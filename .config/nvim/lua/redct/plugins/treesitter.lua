return {
	{
		"nvim-treesitter/nvim-treesitter",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"nvim-treesitter/nvim-treesitter-textobjects",
		},
		build = ":TSUpdate",
		lazy = vim.fn.argc(-1) == 0,
		main = "nvim-treesitter.configs",
		opts = {
			ensure_installed = {
				"bash",
				"c",
				"html",
				"json",
				"lua",
				"luadoc",
				"python",
				"rust",
				"markdown",
				"markdown_inline",
			},
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			textobjects = {
				select = {
					enable = true,
					keymaps = {
						["if"] = "@function.inner",
						["ac"] = "@conditional.outer",
						["ic"] = "@conditional.inner",
						["il"] = "@loop.inner",
						["al"] = "@loop.outer",
					},
				},
			},
		},
	},
}
