return {
	-- "rose-pine/neovim",
	-- name = "rose-pine",
	-- lazy = false,
	-- priority = 1000,
	-- "rebelot/kanagawa.nvim",
	"asilvam133/rose-pine.nvim",
	config = function()
		--
		--
		-- require("onedarkpro").setup({
		--   colors = {
		--     red = "#e08282",
		--     blue = "#6791c9",
		--     green = "#81c19b",
		--     purple = "#a9a1e1",
		--     cyan = "#7DC4CC",
		--     dark = {
		--       bg = "#101012",
		--     },
		--   },
		--
		-- })

		--rosepine
		require("rose-pine").setup({
		    styles = {
		      bold = true,
		      transparency = true,
		  },
		  })
		--
		-- -- Set colorscheme after options
		vim.cmd("colorscheme rose-pine")

		-- Default options:
		-- require("kanagawa").setup({
		-- 	compile = false, -- enable compiling the colorscheme
		-- 	undercurl = true, -- enable undercurls
		-- 	commentStyle = { italic = true },
		-- 	functionStyle = {},
		-- 	-- keywordStyle = { italic = true },
		-- 	keywordStyle = { italic = false },
		-- 	statementStyle = { bold = true },
		-- 	typeStyle = {},
		-- 	transparent = false, -- do not set background color
		-- 	dimInactive = false, -- dim inactive window `:h hl-NormalNC`
		-- 	terminalColors = true, -- define vim.g.terminal_color_{0,17}
		-- 	colors = { -- add/modify theme and palette colors
		-- 		palette = {},
		-- 		theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
		-- 	},
		-- 	overrides = function(colors) -- add/modify highlights
		-- 		return {}
		-- 	end,
		-- 	-- theme = "wave", -- Load "wave" theme when 'background' option is not set
		-- 	background = { -- map the value of 'background' option to a theme
		-- 		dark = "wave", -- try "dragon" !
		-- 		light = "lotus",
		-- 	},
		-- })
		--
		-- -- setup must be called before loading
		-- vim.cmd("colorscheme kanagawa")
	end,
}
