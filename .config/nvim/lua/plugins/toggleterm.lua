return {
	"akinsho/toggleterm.nvim",
	opts = {
		direction = "float",
		float_opts = {
			border = "curved",
		},
	},
	keys = {
		{
			"<A-t>",
			function()
				local arg = vim.fn.argv(0)
				local dir
				if arg ~= "" and vim.fn.isdirectory(arg) == 1 then
					dir = vim.fn.fnamemodify(arg, ":p")
				else
					dir = vim.fn.expand("%:p:h")
					if dir == "" then
						dir = vim.fn.getcwd()
					end
				end
				require("toggleterm").toggle(vim.v.count1, nil, dir, "float")
			end,
			desc = "Toggle terminal",
		},
		{ "<A-t>", "<cmd>ToggleTerm<CR>", mode = "t", desc = "Toggle terminal" },
	},
}
