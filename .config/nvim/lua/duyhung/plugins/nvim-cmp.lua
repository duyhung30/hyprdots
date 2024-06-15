return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer", -- source for text in buffer
		"hrsh7th/cmp-path", -- source for file system paths
		{
			"L3MON4D3/LuaSnip",
			-- follow latest release.
			version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
			-- install jsregexp (optional!).
			build = "make install_jsregexp",
		},
		"saadparwaiz1/cmp_luasnip", -- for autocompletion
		"rafamadriz/friendly-snippets", -- useful snippets
		"onsails/lspkind.nvim", -- vs-code like pictograms
	},
	config = function()
		local cmp = require("cmp")

		local luasnip = require("luasnip")

		local lspkind = require("lspkind")

		local function has_words_before()
			local line, col = (unpack or table.unpack)(vim.api.nvim_win_get_cursor(0))
			return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
		end
		-- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
		require("luasnip.loaders.from_vscode").lazy_load()

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			snippet = { -- configure how nvim-cmp interacts with snippet engine
				expand = function(args)
					luasnip.lsp_expand(args.body)
				end,
			},
			mapping = cmp.mapping.preset.insert({
				["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
				["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
				["<C-b>"] = cmp.mapping.scroll_docs(-4),
				["<C-f>"] = cmp.mapping.scroll_docs(4),
				["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
				["<C-e>"] = cmp.mapping.abort(), -- close completion window
				["<CR>"] = cmp.mapping.confirm({ select = false }),
				["<Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_next_item()
					elseif luasnip.expand_or_locally_jumpable() then
						luasnip.expand_or_jump()
					elseif has_words_before() then
						cmp.complete()
					else
						fallback()
					end
				end, { "i", "s" }),
				["<S-Tab>"] = cmp.mapping(function(fallback)
					if cmp.visible() then
						cmp.select_prev_item()
					elseif luasnip.jumpable(-1) then
						luasnip.jump(-1)
					else
						fallback()
					end
				end, { "i", "s" }),
			}),
			-- sources for autocompletion
			sources = cmp.config.sources({
				{ name = "nvim_lsp" },
				{ name = "luasnip" }, -- snippets
				{ name = "buffer" }, -- text within current buffer
				{ name = "path" }, -- file system paths
			}),

			-- configure lspkind for vs-code like pictograms in completion menu
			formatting = {
				format = lspkind.cmp_format({
					maxwidth = 50,
					ellipsis_char = "...",
				}),
			},
			window = {
				completion = cmp.config.window.bordered(),
				documentation = cmp.config.window.bordered(),
			},
		})
	end,
}

-- ---@diagnostic disable: undefined-field
-- local source_mapping = {
-- 	nvim_lsp = "[LSP]",
-- 	nvim_lua = "[LUA]",
-- 	luasnip = "[SNIP]",
-- 	buffer = "[BUF]",
-- 	path = "[PATH]",
-- 	treesitter = "[TREE]",
-- 	cmp_ai = "[AI]",
-- 	["vim-dadbod-completion"] = "[DB]",
-- }
--
-- local config = function()
-- 	local cmp = require("cmp")
-- 	local lspkind = require("lspkind")
-- 	local cmp_autopairs = require("nvim-autopairs.completion.cmp")
-- 	local cmp_tailwind = require("tailwindcss-colorizer-cmp")
--
-- 	local autocomplete_group = vim.api.nvim_create_augroup("dadbod-autocomplete", { clear = true })
-- 	vim.api.nvim_create_autocmd("FileType", {
-- 		pattern = { "sql", "mysql", "plsql" },
-- 		callback = function()
-- 			cmp.setup.buffer({ sources = { { name = "vim-dadbod-completion" } } })
-- 		end,
-- 		group = autocomplete_group,
-- 	})
--
-- 	cmp.setup({
-- 		enabled = function()
-- 			return require("util.cmp").is_enabled()
-- 		end,
-- 		preselect = cmp.PreselectMode.Item,
-- 		keyword_length = 2,
-- 		snippet = {
-- 			expand = function(args)
-- 				vim.snippet.expand(args.body)
-- 			end,
-- 		},
-- 		window = {
-- 			completion = cmp.config.window.bordered(),
-- 			documentation = cmp.config.window.bordered(),
-- 		},
-- 		view = {
-- 			entries = {
-- 				name = "custom",
-- 				selection_order = "near_cursor",
-- 				follow_cursor = true,
-- 			},
-- 		},
-- 		mapping = cmp.mapping.preset.insert({
-- 			["<CR>"] = cmp.mapping.confirm({
-- 				behavior = cmp.ConfirmBehavior.Replace,
-- 				select = true,
-- 			}),
-- 			["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Select }),
-- 			["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Select }),
-- 			["<C-b>"] = cmp.mapping.scroll_docs(-5),
-- 			["<C-f>"] = cmp.mapping.scroll_docs(5),
-- 			["<C-Space>"] = cmp.mapping.complete(),
-- 			["<C-q>"] = cmp.mapping.abort(),
-- 			["<C-x>"] = cmp.mapping(
-- 				cmp.mapping.complete({
-- 					config = {
-- 						sources = cmp.config.sources({
-- 							{ name = "cmp_ai" },
-- 						}),
-- 					},
-- 				}),
-- 				{ "i" }
-- 			),
-- 		}),
-- 		sources = cmp.config.sources({
-- 			{
-- 				name = "luasnip",
-- 				group_index = 1,
-- 				option = { use_show_condition = true },
-- 				entry_filter = function()
-- 					local context = require("cmp.config.context")
-- 					return not context.in_treesitter_capture("string") and not context.in_syntax_group("String")
-- 				end,
-- 			},
-- 			{
-- 				name = "nvim_lsp",
-- 				group_index = 2,
-- 			},
-- 			{
-- 				name = "codeium",
-- 				group_index = 2,
-- 				option = { use_show_condition = true },
-- 				entry_filter = function()
-- 					return not vim.g.leetcode
-- 				end,
-- 			},
-- 			{
-- 				name = "nvim_lua",
-- 				group_index = 3,
-- 			},
-- 			{
-- 				name = "crates",
-- 				group_index = 3,
-- 			},
-- 			{
-- 				name = "treesitter",
-- 				keyword_length = 4,
-- 				group_index = 4,
-- 			},
-- 			{
-- 				name = "path",
-- 				keyword_length = 4,
-- 				group_index = 4,
-- 			},
-- 			{
-- 				name = "buffer",
-- 				keyword_length = 3,
-- 				group_index = 5,
-- 				option = {
-- 					get_bufnrs = function()
-- 						local bufs = {}
-- 						for _, win in ipairs(vim.api.nvim_list_wins()) do
-- 							bufs[vim.api.nvim_win_get_buf(win)] = true
-- 						end
-- 						return vim.tbl_keys(bufs)
-- 					end,
-- 				},
-- 			},
-- 			{
-- 				name = "emoji",
-- 				keyword_length = 2,
-- 				group_index = 6,
-- 			},
-- 			{
-- 				name = "nerdfont",
-- 				keyword_length = 2,
-- 				group_index = 6,
-- 			},
-- 		}),
-- 		formatting = {
-- 			format = lspkind.cmp_format({
-- 				mode = "symbol_text",
-- 				ellipsis_char = "...",
-- 				before = function(entry, vim_item)
-- 					cmp_tailwind.formatter(entry, vim_item)
-- 					return vim_item
-- 				end,
-- 				menu = source_mapping,
-- 			}),
-- 		},
-- 		sorting = {
-- 			priority_weight = 2,
-- 			comparators = {
-- 				cmp.config.compare.offset,
-- 				cmp.config.compare.exact,
-- 				cmp.config.compare.score,
-- 				cmp.config.compare.recently_used,
-- 				cmp.config.compare.locality,
-- 				cmp.config.compare.kind,
-- 				cmp.config.compare.sort_text,
-- 				cmp.config.compare.length,
-- 				cmp.config.compare.order,
-- 			},
-- 		},
-- 		experimental = {
-- 			native_menu = false,
-- 			ghost_text = false,
-- 		},
-- 	})
-- 	--@diagnostic disable-next-line: undefined-field
-- 	cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
--
-- 	-- require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
-- 	-- 	sources = {
-- 	-- 		{ name = "dap" },
-- 	-- 	},
-- 	-- })
-- end
--
-- return {
-- 	"hrsh7th/nvim-cmp",
-- 	config = config,
-- 	event = "InsertEnter",
-- 	dependencies = {
-- 		"hrsh7th/cmp-nvim-lsp",
-- 		dependencies = {
-- 		"onsails/lspkind.nvim", -- vs-code like pictograms
-- 			"L3MON4D3/LuaSnip",
-- 			"hrsh7th/cmp-buffer",
-- 			"hrsh7th/cmp-path",
-- 			"hrsh7th/cmp-cmdline",
-- 			"hrsh7th/cmp-nvim-lua",
-- 			"hrsh7th/cmp-emoji",
-- 			"chrisgrieser/cmp-nerdfont",
-- 			"ray-x/cmp-treesitter",
-- 			"saadparwaiz1/cmp_luasnip",
-- 			"roobert/tailwindcss-colorizer-cmp.nvim",
-- 			"jcdickinson/codeium.nvim",
-- 		},
-- 	},
-- }
