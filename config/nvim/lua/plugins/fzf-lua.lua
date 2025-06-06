return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "echasnovski/mini.icons" },
	opts = {},
	keys = {
		{
			"<C-\\>",
			function()
				require("fzf-lua").buffers()
			end,
			desc = "Find Buffers",
		},
		{
			"<C-k>",
			function()
				require("fzf-lua").builtin()
			end,
			desc = "FZF Built-in Commands",
		},
		{
			"<C-p>",
			function()
				require("fzf-lua").files()
			end,
			desc = "Find Files",
		},
		{
			"<C-l>",
			function()
				require("fzf-lua").live_grep_glob()
			end,
			desc = "Live Grep (Global)",
		},
		{
			"<C-g>",
			function()
				require("fzf-lua").grep_project()
			end,
			desc = "Grep (Project)",
		},
		{
			"<F1>",
			function()
				require("fzf-lua").help_tags()
			end,
			desc = "Help Tags",
		},
	},
}
