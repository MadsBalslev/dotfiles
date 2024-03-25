return {
	{
		"pantharshit00/vim-prisma",
	},
	{
		"mhartington/formatter.nvim",
		lazy = false,
		config = function()
			require("formatter").setup({
				logging = false,
				filetype = {
					javascript = {
						function()
							return {
								exe = "prettier",
								args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
					typescript = {
						function()
							return {
								exe = "prettier",
								args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
					svelte = {
						function()
							return {
								exe = "prettier",
								args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
					css = {
						function()
							return {
								exe = "prettier",
								args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
					html = {
						function()
							return {
								exe = "prettier",
								args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
					json = {
						function()
							return {
								exe = "prettier",
								args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
					yaml = {
						function()
							return {
								exe = "prettier",
								args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
					markdown = {
						function()
							return {
								exe = "prettier",
								args = { "--stdin-filepath", vim.api.nvim_buf_get_name(0) },
								stdin = true,
							}
						end,
					},
					lua = {
						function()
							return {
								exe = "stylua",
								args = { "-" },
								stdin = true,
							}
						end,
					},
					prisma = {
						function()
							return {
								exe = "prisma-fmt",
								args = { "-" },
								stdin = true,
							}
						end,
					},
				},
			})
		end,
	},
	{
		"stevearc/conform.nvim",
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					javascript = { "prettier" },
					typescript = { "prettier" },
					svelte = { "prettier" },
					css = { "prettier" },
					html = { "prettier" },
					json = { "prettier" },
					yaml = { "prettier" },
					markdown = { "prettier" },
					lua = { "stylua" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>fm", function()
				conform.format({
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				})
			end, { desc = "Format file or range (in visual mode)" })
		end,
	},
}
