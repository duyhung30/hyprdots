return {
	"kyazdani42/nvim-tree.lua",
	lazy = true,
	cmd = "NvimTreeToggle",
	keys = {
		{ "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "NvimTree" },
	},
	config = function()
		local git_icons = {
			unstaged = "",
			staged = "",
			unmerged = "",
			renamed = "➜",
			untracked = "",
			deleted = "",
			ignored = "◌",
		}
		require("nvim-tree").setup({
			on_attach = function(bufnr)
				local api = require("nvim-tree.api")

				local function opts(desc)
					return {
						desc = "nvim-tree: " .. desc,
						buffer = bufnr,
						noremap = true,
						silent = true,
						nowait = true,
					}
				end

				-- default mappings
				api.config.mappings.default_on_attach(bufnr)

				-- custom mappings
				vim.keymap.set("n", "l", api.node.open.tab, opts("Tab"))
			end,
			actions = {
				open_file = {
					quit_on_open = true,
				},
			},
			sort = {
				sorter = "case_sensitive",
			},
			view = {
				width = 30,
				relativenumber = true,
			},
			-- renderer = {
			-- 	group_empty = true,
			-- },
			renderer = {
				group_empty = true,
				highlight_git = true,
				highlight_opened_files = "none",
				root_folder_label = ":~",
				indent_markers = {
					enable = false,
					icons = {
						corner = "└ ",
						edge = "│ ",
						none = "  ",
					},
				},
				icons = {
					show = {
						file = true,
						folder = true,
						folder_arrow = true,
						git = true,
						modified = true,
					},
					glyphs = {
						git = git_icons,
					},
				},
			},
			filters = {
				dotfiles = true,
				custom = {
					"node_modules/.*",
				},
			},
			log = {
				enable = true,
				truncate = true,
				types = {
					diagnostics = true,
					git = true,
					profile = true,
					watcher = true,
				},
			},
		})
	end,
}
