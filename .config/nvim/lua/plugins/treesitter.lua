return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPost", "BufNewFile" },
	cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
	build = ":TSUpdate | TSInstallAll",
	main = "nvim-treesitter.configs",
	opts = {
		auto_install = true,
		highlight = { enable = true },
		indent = { enable = true },
	},
}
