return {
	{
		"MunifTanjim/nui.nvim",
		config = function()
			require("nui").setup({
				mappings = {
					close = { "q", "<Esc>" },
				},
			})
		end,
	},
}
