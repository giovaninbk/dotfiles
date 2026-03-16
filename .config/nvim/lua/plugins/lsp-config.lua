return {
	{
		"mason-org/mason.nvim",
		cmd = { "Mason", "MasonInstall", "MasonUpdate" },
		opts = {
			PATH = "skip",

			ui = {
				icons = {
					package_pending = " ",
					package_installed = " ",
					package_uninstalled = " ",
				},
			},

			max_concurrent_installers = 10,
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		lazy = false,
		opts = {
			auto_install = true,
		},
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local servers = { "html", "cssls", "clojure_lsp", "typescript_language_server" }
			vim.lsp.enable(servers)

			vim.lsp.config("typescript_language_server", {
				filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
				cmd = { "typescript-language-server", "--stdio" }, -- Command to start the server
				settings = {
					-- Optional: Configure the server to find the nearest project root (package.json or tsconfig.json)
					-- This helps with monorepos and mixed JS/TS projects
					-- You may need to use an adapter like tsgo for optimal monorepo support
					-- Example setting:
					-- tsserver = {
					--     root_dir = lspconfig.util.root_finder({ "tsconfig.json", "package.json" }, { upward = true })(),
					-- }
				},
			})

			-- vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			-- vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			-- vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
			-- vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
		end,
	},
}
