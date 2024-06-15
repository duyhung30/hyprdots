return {

	{
		"alvan/vim-closetag",
		config = function()
			vim.g.closetag_filenames = "*.html,*.xhtml,*.phtml"
			vim.g.closetag_xhtml_filenames = "*.xhtml,*.jsx"
		end,
	},
	{ "windwp/nvim-autopairs", config = true, event = "InsertEnter" },
	{ "ahmedkhalf/project.nvim" },
	{ "numToStr/Comment.nvim", config = true, event = "BufEnter" },
	{ "lewis6991/gitsigns.nvim", config = true, event = "BufEnter" },
	{
		"kdheepak/lazygit.nvim",
		keys = {
			{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "NeoTree" },
		},
	},
	{
		"norcalli/nvim-colorizer.lua",
    event = "VeryLazy",
		config = function()
			require("colorizer").setup()
		end,
	},
	{ "windwp/nvim-ts-autotag" },
	{
		"iamcco/markdown-preview.nvim",
		-- init = function()
		-- 	vim.g.mkdp_filetypes = { "markdown" }
		-- end,
		-- ft = { "markdown" },
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
	{
		"christoomey/vim-tmux-navigator",
	},
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup({})
		end,
	},
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		init = function()
			vim.o.timeout = true
			vim.o.timeoutlen = 300
		end,
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
    enabled = false,
	},
}
