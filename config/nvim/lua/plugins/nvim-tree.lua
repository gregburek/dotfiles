return {
	"nvim-tree/nvim-tree.lua",
	version = "*",
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({})
		-- The function to be called by the autocmd
		local function open_nvim_tree()
			-- open the tree
			require("nvim-tree.api").tree.open()
		end

		-- Create a dedicated autocommand group
		local NvimTreeOnEnter = vim.api.nvim_create_augroup("NvimTreeOnEnter", { clear = true })

		-- Create the autocmd that calls the function
		vim.api.nvim_create_autocmd("VimEnter", {
			group = NvimTreeOnEnter,
			callback = open_nvim_tree,
		})
	end,
	opt = {
		update_focused_file = {
			enable = true,
		},
	},
}
