return {
	{
		"L3MON4D3/LuaSnip",
		dependencies = "rafamadriz/friendly-snippets",
		version = "v2.*",
		build = "make install_jsregexp",
		opts = { history = true, updateevents = "TextChanged,TextChangedI" },
		config = function(_, opts)
			require("luasnip").config.set_config(opts)
			require("luasnip.loaders.from_vscode").lazy_load()
		end,
	},

	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		opts = {
			fast_wrap = {},
			disable_filetype = { "TelescopePrompt", "vim" },
		},
	},

	{
		"saghen/blink.cmp",
		event = "InsertEnter",
		version = "1.*",
		dependencies = { "L3MON4D3/LuaSnip" },
		---@module "blink.cmp"
		---@type blink.cmp.Config
		opts = {
			-- <C-space> show / docs / hide
			-- <C-e> hide, <CR> accept, <C-y> accept
			-- <C-n>/<C-p>, <Up>/<Down> select prev/next
			-- <C-b>/<C-f> scroll docs
			-- <Tab>/<S-Tab> snippet forward/backward
			keymap = { preset = "default" },

			snippets = { preset = "luasnip" },

			sources = {
				default = { "lsp", "snippets", "path", "buffer" },
			},

			completion = {
				menu = {
					border = "rounded",
					draw = { treesitter = { "lsp" } },
				},
				documentation = {
					auto_show = true,
					auto_show_delay_ms = 200,
					window = { border = "rounded" },
				},
				accept = {
					-- LSP-driven brackets for function completions
					-- (replaces the old nvim-cmp + nvim-autopairs confirm_done hook)
					auto_brackets = { enabled = true },
				},
			},

			signature = { enabled = true, window = { border = "rounded" } },

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
