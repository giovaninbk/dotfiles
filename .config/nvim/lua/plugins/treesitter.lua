return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate",
	main = "nvim-treesitter.config",
	opts = {
		auto_install = true,
		ensure_installed = { "json", "yaml" },
		highlight = { enable = true },
		indent = { enable = true },
	},
}
