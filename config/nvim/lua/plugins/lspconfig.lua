return {
	{
		"stevearc/conform.nvim",
		opts = function()
			local plugin = require("lazy.core.config").plugins["conform.nvim"]
			---@type conform.setupOpts
			local opts = {
				default_format_opts = {
					timeout_ms = 3000,
					async = false, -- not recommended to change
					quiet = false, -- not recommended to change
					lsp_format = "fallback", -- not recommended to change
				},
				formatters_by_ft = {
					lua = { "stylua" },
					sh = { "shfmt" },
					json = { "prettierd", "prettier", stop_after_first = true },
					python = { "ruff" },
					go = { "gofmt", "goimports" },
					yaml = { "yamlfmt" },
					["*"] = { "trim_whitespace" },
				},
				-- The options you set here will be merged with the builtin formatters.
				-- You can also define any custom formatters here.
				---@type table<string, conform.FormatterConfigOverride|fun(bufnr: integer): nil|conform.FormatterConfigOverride>
				formatters = {
					injected = { options = { ignore_errors = true } },
					prettier = {
						prepend_args = { "--single-quote", "--trailing-comma es5", "--print-width 79" },
					},
					shfmt = {
						prepend_args = { "-s", "-i", "2", "-ci" },
					},
				},
			}
			return opts
		end,
	},
}
