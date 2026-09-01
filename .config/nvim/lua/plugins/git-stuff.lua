return {
	{
		"tpope/vim-fugitive",
		cmd = { "Git", "G" },
		dependencies = { "tpope/vim-rhubarb" },
		keys = {
			{
				"<leader>gc",
				function()
					local line = vim.fn.line(".")
					local file = vim.fn.expand("%")
					local blame = vim.fn.systemlist(
						{ "git", "blame", "-L", line .. "," .. line, "--porcelain", "--", file }
					)[1]
					local sha = blame and blame:match("^%x+")
					if sha and not sha:match("^0+$") then
						vim.cmd("GBrowse " .. sha)
					else
						vim.notify("No commit for this line (uncommitted)", vim.log.levels.WARN)
					end
				end,
				desc = "Open line's commit in GitHub",
			},
		},
	},
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				delete = { text = "󰍵" },
				changedelete = { text = "󱕖" },
			},
		},
		keys = {
			{ "<leader>gp", ":Gitsigns preview_hunk<CR>", desc = "Preview hunk" },
			{ "<leader>gt", ":Gitsigns toggle_current_line_blame<CR>", desc = "Toggle line blame" },
		},
	},
}
