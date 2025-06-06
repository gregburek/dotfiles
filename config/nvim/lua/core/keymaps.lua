-- ~/.config/nvim/lua/core/keymaps.lua

local opts = { silent = true }
local map = vim.keymap.set

-- => General
map("n", "<leader>w", ":w!<cr>", { desc = "Save file with permissions" })

-- => Moving around, tabs, windows and buffers
map({ "n", "i" }, "<C-j>", "<C-W>j", { desc = "Move to window below" })
map({ "n", "i" }, "<C-k>", "<C-W>k", { desc = "Move to window above" })
map({ "n", "i" }, "<C-h>", "<C-W>h", { desc = "Move to window left" })
map({ "n", "i" }, "<C-l>", "<C-W>l", { desc = "Move to window right" })
map("n", "<Space>", "/", { desc = "Search forward" })
map("n", "<c-space>", "?", { desc = "Search backward" })
map("n", "<leader><cr>", ":noh<cr>", opts)
map("n", "<leader>bd", ":Bclose<cr>", { desc = "Close current buffer" })
map("n", "<leader>ba", ":bufdo bd<cr>", { desc = "Close all buffers" })
map("n", "<leader>l", ":bnext<cr>", { desc = "Next buffer" })
map("n", "<leader>h", ":bprevious<cr>", { desc = "Previous buffer" })
map("n", "<leader>tn", ":tabnew<cr>", { desc = "New tab" })
map("n", "<leader>to", ":tabonly<cr>", { desc = "Tab only" })
map("n", "<leader>tc", ":tabclose<cr>", { desc = "Close tab" })
map("n", "<leader>tm", ":tabmove ", { desc = "Move tab" })
map("n", "<leader>te", [[:tabedit <c-r>=expand("%:p:h")<cr>/]], { desc = "New tab in current dir" })
map("n", "<leader>cd", ":cd %:p:h<cr>:pwd<cr>", { desc = "Change to buffer directory" })

-- Let 'tl' toggle between this and the last accessed tab
vim.g.lasttab = 1
map("n", "<Leader>tl", ":exe 'tabn ' . g.lasttab<CR>", { desc = "Go to last tab" })

-- => Insert Mode
map("i", "jk", "<Esc>", { desc = "Escape insert mode" })
map("i", "JK", "<Esc>", { desc = "Escape insert mode" })

-- => Editing
map("n", "<M-j>", "mz:m+<cr>`z", { desc = "Move line down" })
map("n", "<M-k>", "mz:m-2<cr>`z", { desc = "Move line up" })
map("v", "<M-j>", ":m'>+<cr>`<my`>mzgv`yo`z", { desc = "Move selection down" })
map("v", "<M-k>", ":m'<-2<cr>`>my`<mzgv`yo`z", { desc = "Move selection up" })

-- => Spell checking
map("n", "<leader>ss", ":setlocal spell!<cr>", { desc = "Toggle spell check" })
map("n", "<leader>sn", "]s", { desc = "Next spelling error" })
map("n", "<leader>sp", "[s", { desc = "Previous spelling error" })
map("n", "<leader>sa", "zg", { desc = "Add word to dictionary" })
map("n", "<leader>s?", "z=", { desc = "Spelling suggestions" })

-- => Misc
map("n", "<Leader>m", "mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm", { desc = "Remove Windows ^M characters" })
map("n", "<leader>q", ":e ~/buffer<cr>", { desc = "Open scratch buffer" })
map("n", "<leader>x", ":e ~/buffer.md<cr>", { desc = "Open markdown scratch buffer" })
map("n", "<leader>pp", ":setlocal paste!<cr>", { desc = "Toggle paste mode" })

-- Return to last edit position when opening files
vim.api.nvim_create_autocmd("BufReadPost", {
	pattern = "*",
	callback = function()
		local line = vim.fn.line("'\"")
		if line > 1 and line <= vim.fn.line("$") then
			vim.cmd('normal! g`"')
		end
	end,
})

-- Let g:lasttab = 1
vim.api.nvim_create_autocmd("TabLeave", {
	pattern = "*",
	callback = function()
		vim.g.lasttab = vim.fn.tabpagenr()
	end,
})
