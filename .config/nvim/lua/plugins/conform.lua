return {
	"stevearc/conform.nvim",
	event = "BufWritePre",
	opts = {
formatters_by_ft = {
			lua = { "stylua" },
			clojure = { "cljfmt" },
			json = { "prettierd" },
			jsonc = { "prettierd" },
			-- css = { "prettier" },
			-- html = { "prettier" },
		},
		format_on_save = function(bufnr)
			-- Disable lsp fallback for clojure — cljfmt handles it via conform
			local lsp_fallback = vim.bo[bufnr].filetype ~= "clojure"
			return { timeout_ms = 500, lsp_fallback = lsp_fallback }
		end,
	},
}
