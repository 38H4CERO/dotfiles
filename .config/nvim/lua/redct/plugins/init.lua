return {

	{ "nvim-lua/plenary.nvim" },
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = true,
	},
	{ "stevearc/dressing.nvim", event = "VeryLazy" },
	{
		"MeanderingProgrammer/render-markdown.nvim",
		dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
	},
}
