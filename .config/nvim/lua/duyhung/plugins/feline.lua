-- return {
-- 	"freddiehaddad/feline.nvim",
-- 	config = function()
-- 		local present, feline = pcall(require, "feline")
-- 		if not present then
-- 			return
-- 		end
--
-- 		local theme = {
-- 			aqua = "#7AB0DF",
-- 			-- bg = "#1C212A",
-- 			-- bg = "#1B2124",
-- 			-- bg = "#191724", --rosepine
-- 			-- bg = "#16161D", --kanagawa
--       bg = "#C8C093", --kanagawa lotus
-- 			blue = "#5FB0FC",
-- 			cyan = "#70C0BA",
-- 			darkred = "#FB7373",
-- 			-- fg = "#C7C7CA",
--       -- fg = "#C8C093", --kanagawa
--       fg = "#2D4F67", --kanagawa lotus
-- 			gray = "#222730",
-- 			green = "#79DCAA",
-- 			lime = "#54CED6",
-- 			orange = "#FFD064",
-- 			pink = "#D997C8",
-- 			purple = "#C397D8",
-- 			red = "#F87070",
-- 			yellow = "#FFE59E",
-- 			-- rosepine
-- 			normal = "#EBBCBA",
-- 			insert = "#9CCFD8",
-- 			visual = "#C4A7E7",
-- 			command = "#EB6F92",
--       -- kanagawa
-- 			normal = "#2D4F67",
-- 			insert = "#76946A",
-- 			visual = "#7E9CD8",
-- 			command = "#FF5D62",
-- 		}
--
-- 		vim.api.nvim_set_hl(0, "StatusLine", { bg = "#101317", fg = "#7AB0DF" })
--
-- 		local mode_theme = {
-- 			-- ["NORMAL"] = theme.green,
-- 			["NORMAL"] = theme.normal,
-- 			["OP"] = theme.cyan,
-- 			-- ["INSERT"] = theme.aqua,
-- 			["INSERT"] = theme.insert,
-- 			-- ["VISUAL"] = theme.yellow,
-- 			["VISUAL"] = theme.visual,
-- 			["LINES"] = theme.darkred,
-- 			-- ["BLOCK"] = theme.orange,
-- 			["BLOCK"] = theme.visual,
-- 			["REPLACE"] = theme.purple,
-- 			["V-REPLACE"] = theme.pink,
-- 			["ENTER"] = theme.pink,
-- 			["MORE"] = theme.pink,
-- 			["SELECT"] = theme.darkred,
-- 			["SHELL"] = theme.cyan,
-- 			["TERM"] = theme.lime,
-- 			["NONE"] = theme.gray,
-- 			-- ["COMMAND"] = theme.blue,
-- 			["COMMAND"] = theme.command,
-- 		}
--
-- 		local modes = setmetatable({
-- 			-- ["n"] = "NOR",
-- 			["n"] = "普通",
-- 			-- ["no"] = "NOR",
-- 			["no"] = "普通",
-- 			-- ["v"] = "VIS",
-- 			["v"] = "視覚",
-- 			-- ["V"] = "VLINE",
-- 			["V"] = "視線",
-- 			-- [""] = "VBLOCK",
-- 			["^v"] = "視覚",
-- 			["s"] = "S",
-- 			["S"] = "SL",
-- 			[""] = "SB",
-- 			-- ["i"] = "I",
-- 			["i"] = "挿入",
-- 			-- ["ic"] = "I",
-- 			["ic"] = "挿入",
-- 			["R"] = "R",
-- 			["Rv"] = "VR",
-- 			-- ["c"] = "COM",
-- 			["c"] = "指示",
-- 			["cv"] = "EX",
-- 			["ce"] = "X",
-- 			["r"] = "P",
-- 			["rm"] = "M",
-- 			["r?"] = "C",
-- 			["!"] = "SH",
-- 			["t"] = "T",
-- 		}, {
-- 			__index = function()
-- 				return "-"
-- 			end,
-- 		})
--
-- 		local component = {}
--
-- 		component.vim_mode = {
-- 			provider = function()
-- 				return modes[vim.api.nvim_get_mode().mode]
-- 			end,
-- 			hl = function()
-- 				return {
-- 					fg = "bg",
-- 					bg = require("feline.providers.vi_mode").get_mode_color(),
-- 					style = "bold",
-- 					name = "NeovimModeHLColor",
-- 				}
-- 			end,
-- 			left_sep = "block",
-- 			right_sep = "block",
-- 		}
--
-- 		component.git_branch = {
-- 			provider = "git_branch",
-- 			hl = {
-- 				fg = "fg",
-- 				bg = "bg",
-- 				style = "bold",
-- 			},
-- 			left_sep = "block",
-- 			right_sep = "",
-- 		}
--
-- 		component.git_add = {
-- 			provider = "git_diff_added",
-- 			hl = {
-- 				fg = "green",
-- 				bg = "bg",
-- 			},
-- 			left_sep = "",
-- 			right_sep = "",
-- 		}
--
-- 		component.git_delete = {
-- 			provider = "git_diff_removed",
-- 			hl = {
-- 				fg = "red",
-- 				bg = "bg",
-- 			},
-- 			left_sep = "",
-- 			right_sep = "",
-- 		}
--
-- 		component.git_change = {
-- 			provider = "git_diff_changed",
-- 			hl = {
-- 				fg = "purple",
-- 				bg = "bg",
-- 			},
-- 			left_sep = "",
-- 			right_sep = "",
-- 		}
--
-- 		component.separator = {
-- 			provider = "",
-- 			hl = {
-- 				fg = "bg",
-- 				bg = "bg",
-- 			},
-- 		}
--
-- 		component.diagnostic_errors = {
-- 			provider = "diagnostic_errors",
-- 			hl = {
-- 				fg = "red",
-- 			},
-- 		}
--
-- 		component.diagnostic_warnings = {
-- 			provider = "diagnostic_warnings",
-- 			hl = {
-- 				fg = "yellow",
-- 			},
-- 		}
--
-- 		component.diagnostic_hints = {
-- 			provider = "diagnostic_hints",
-- 			hl = {
-- 				fg = "aqua",
-- 			},
-- 		}
--
-- 		component.diagnostic_info = {
-- 			provider = "diagnostic_info",
-- 		}
--
-- 		component.lsp = {
-- 			provider = "lsp_client_names",
-- 			hl = {
-- 				fg = "fg",
-- 				bg = "bg",
-- 			},
-- 			-- provider = function()
-- 			--   if not rawget(vim, "lsp") then
-- 			--     return ""
-- 			--   end
-- 			--
-- 			--   local progress = vim.lsp.util.get_progress_messages()[1]
-- 			--   if vim.o.columns < 120 then
-- 			--     return ""
-- 			--   end
-- 			--
-- 			--   local clients = vim.lsp.get_active_clients({ bufnr = 0 })
-- 			--   if #clients ~= 0 then
-- 			--     if progress then
-- 			--       local spinners = {
-- 			--         "◜ ",
-- 			--         "◠ ",
-- 			--         "◝ ",
-- 			--         "◞ ",
-- 			--         "◡ ",
-- 			--         "◟ ",
-- 			--       }
-- 			--       local ms = vim.loop.hrtime() / 1000000
-- 			--       local frame = math.floor(ms / 120) % #spinners
-- 			--       local content = string.format("%%<%s", spinners[frame + 1])
-- 			--       return content or ""
-- 			--     else
-- 			--       return "לּ LSP"
-- 			--     end
-- 			--   end
-- 			--   return ""
-- 			-- end,
-- 			-- hl = function()
-- 			--   local progress = vim.lsp.util.get_progress_messages()[1]
-- 			--   return {
-- 			--     fg = progress and "yellow" or "green",
-- 			--     bg = "gray",
-- 			--     style = "bold",
-- 			--   }
-- 			-- end,
-- 			left_sep = "block",
-- 			right_sep = "block",
-- 		}
--
-- 		component.file_type = {
-- 			provider = {
-- 				name = "file_type",
-- 				opts = {
-- 					filetype_icon = true,
-- 				},
-- 			},
-- 			hl = {
-- 				fg = "fg",
-- 				-- bg = "gray",
-- 				bg = "bg",
-- 			},
-- 			left_sep = "block",
-- 			right_sep = "block",
-- 		}
--
-- 		component.file_info = {
-- 			provider = {
-- 				name = "file_info",
-- 				opts = {
-- 					-- type = "relative-short",
-- 					type = "short",
-- 				},
-- 			},
-- 			hl = {
-- 				fg = "fg",
-- 				bg = "bg",
-- 			},
-- 			left_sep = "block",
-- 			right_sep = "block",
-- 		}
-- 		component.scroll_bar = {
-- 			provider = "scroll_bar",
-- 			hl = {
-- 				fg = "fg",
-- 				bg = "bg",
-- 			},
-- 			-- provider = function()
-- 			--   local chars = setmetatable({
-- 			--     " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
-- 			--     " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
-- 			--   }, { __index = function() return " " end })
-- 			--   local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
-- 			--   local position = math.floor(line_ratio * 100)
-- 			--
-- 			--   local icon = chars[math.floor(line_ratio * #chars)] .. position
-- 			--   if position <= 5 then
-- 			--     icon = " TOP"
-- 			--   elseif position >= 95 then
-- 			--     icon = " BOT"
-- 			--   end
-- 			--   return icon
-- 			-- end,
-- 			-- hl = function()
-- 			--   local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
-- 			--   local fg
-- 			--   local style
-- 			--
-- 			--   if position <= 5 then
-- 			--     fg = "aqua"
-- 			--     style = "bold"
-- 			--   elseif position >= 95 then
-- 			--     fg = "red"
-- 			--     style = "bold"
-- 			--   else
-- 			--     fg = "purple"
-- 			--     style = nil
-- 			--   end
-- 			--   return {
-- 			--     fg = fg,
-- 			--     style = style,
-- 			--     bg = "bg",
-- 			--   }
-- 			-- end,
-- 			left_sep = "block",
-- 			right_sep = "block",
-- 		}
--
-- 		local left = {
-- 			component.vim_mode,
-- 			component.file_info,
-- 			component.file_type,
-- 		}
-- 		local middle = {}
-- 		local right = {
-- 			component.lsp,
-- 			component.git_branch,
-- 			component.git_add,
-- 			component.git_delete,
-- 			component.git_change,
-- 			component.separator,
-- 			component.diagnostic_errors,
-- 			component.diagnostic_warnings,
-- 			component.diagnostic_info,
-- 			component.diagnostic_hints,
-- 			component.scroll_bar,
-- 		}
--
-- 		local components = {
-- 			active = { left, middle, right },
-- 		}
--
-- 		feline.setup({
-- 			components = components,
-- 			theme = theme,
-- 			vi_mode_colors = mode_theme,
-- 		})
-- 	end,
-- }
--

return {
	"freddiehaddad/feline.nvim",
  enabled = false,
	config = function()
		local present, feline = pcall(require, "feline")
		if not present then
			return
		end
    -- Get the colors for the current theme
    -- local colors = require("kanagawa.colors").setup()
    -- local palette_colors = colors.palette
    -- local theme_colors = colors.theme
    local theme = require("kanagawa.colors").setup().theme

		-- vim.api.nvim_set_hl(0, "StatusLine", { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim })

			-- normal = "#2D4F67",
			-- insert = "#76946A",
			-- visual = "#7E9CD8",
			-- command = "#FF5D62",
		local mode_theme = {
			-- ["NORMAL"] = theme.green,
			["NORMAL"] = "#2D4F67",
			["OP"] = theme.syn.fun,
			-- ["INSERT"] = theme.aqua,
			["INSERT"] = "#76946A",
			-- ["VISUAL"] = theme.yellow,
			["VISUAL"] = "#7E9CD8",
			["LINES"] = "#7E9CD8",
			-- ["BLOCK"] = theme.orange,
			["BLOCK"] = "#7E9CD8",
			["REPLACE"] = theme.syn.keyword,
			["V-REPLACE"] = theme.syn.number,
			["ENTER"] = theme.syn.number,
			["MORE"] = theme.syn.number,
			["SELECT"] = theme.syn.special2,
			["SHELL"] = theme.diag.ok,
			["TERM"] = theme.diff.add,
			["NONE"] = theme.syn.comment,
			-- ["COMMAND"] = theme.blue,
			["COMMAND"] = "#FF5D62",
		}

		local modes = setmetatable({
			-- ["n"] = "NOR",
			["n"] = "普通",
			-- ["no"] = "NOR",
			["no"] = "普通",
			-- ["v"] = "VIS",
			["v"] = "視覚",
			-- ["V"] = "VLINE",
			["V"] = "視線",
			-- [""] = "VBLOCK",
			["^v"] = "視覚",
			["s"] = "S",
			["S"] = "SL",
			[""] = "SB",
			-- ["i"] = "I",
			["i"] = "挿入",
			-- ["ic"] = "I",
			["ic"] = "挿入",
			["R"] = "R",
			["Rv"] = "VR",
			-- ["c"] = "COM",
			["c"] = "指示",
			["cv"] = "EX",
			["ce"] = "X",
			["r"] = "P",
			["rm"] = "M",
			["r?"] = "C",
			["!"] = "SH",
			["t"] = "T",
		}, {
			__index = function()
				return "-"
			end,
		})

		local component = {}
    component.space = {
			hl = {
				-- fg = theme.ui.fg_dim,
				bg = theme.ui.bg_m3,
				style = "bold",
			},
    }

		component.vim_mode = {
			provider = function()
				return modes[vim.api.nvim_get_mode().mode]
			end,
			hl = function()
				return {
					fg = "#C8C093",
					-- fg = theme.ui.fg_dim,
					bg = require("feline.providers.vi_mode").get_mode_color(),
					style = "bold",
					name = "NeovimModeHLColor",
				}
			end,
			left_sep = "block",
			right_sep = "block",
		}

		component.git_branch = {
			provider = "git_branch",
			hl = {
				fg = theme.ui.fg_dim,
				bg = theme.ui.bg_m3,
				style = "bold",
			},
			left_sep = "block",
			right_sep = "",
		}

		component.git_add = {
			provider = "git_diff_added",
			hl = {
				fg = theme.vcs.added,
				bg = theme.ui.bg_m3,
			},
			left_sep = "",
			right_sep = "",
		}

		component.git_delete = {
			provider = "git_diff_removed",
			hl = {
				fg = theme.vcs.removed,
				bg = theme.ui.bg_m3,
			},
			left_sep = "",
			right_sep = "",
		}

		component.git_change = {
			provider = "git_diff_changed",
			hl = {
				fg = theme.vcs.changed,
				bg = theme.ui.bg_m3,
			},
			left_sep = "",
			right_sep = "",
		}

		component.separator = {
			provider = "",
			hl = {
				fg = theme.ui.fg_dim,
				bg = theme.ui.bg_m3,
			},
		}

		component.diagnostic_errors = {
			provider = "diagnostic_errors",
			hl = {
				fg = theme.diag.error,
        bg = theme.ui.bg_m3,
			},
		}

		component.diagnostic_warnings = {
			provider = "diagnostic_warnings",
			hl = {
				fg = theme.diag.warning,
        bg = theme.ui.bg_m3,
			},
		}

		component.diagnostic_hints = {
			provider = "diagnostic_hints",
			hl = {
				fg = theme.diag.hint,
        bg = theme.ui.bg_m3,
			},
		}

		component.diagnostic_info = {
			provider = "diagnostic_info",
        bg = theme.ui.bg_m3,
		}

		component.lsp = {
			provider = "lsp_client_names",
			hl = {
				fg = theme.ui.fg_dim,
				bg = theme.ui.bg_m3,
			},
			-- provider = function()
			--   if not rawget(vim, "lsp") then
			--     return ""
			--   end
			--
			--   local progress = vim.lsp.util.get_progress_messages()[1]
			--   if vim.o.columns < 120 then
			--     return ""
			--   end
			--
			--   local clients = vim.lsp.get_active_clients({ bufnr = 0 })
			--   if #clients ~= 0 then
			--     if progress then
			--       local spinners = {
			--         "◜ ",
			--         "◠ ",
			--         "◝ ",
			--         "◞ ",
			--         "◡ ",
			--         "◟ ",
			--       }
			--       local ms = vim.loop.hrtime() / 1000000
			--       local frame = math.floor(ms / 120) % #spinners
			--       local content = string.format("%%<%s", spinners[frame + 1])
			--       return content or ""
			--     else
			--       return "לּ LSP"
			--     end
			--   end
			--   return ""
			-- end,
			-- hl = function()
			--   local progress = vim.lsp.util.get_progress_messages()[1]
			--   return {
			--     fg = progress and "yellow" or "green",
			--     bg = "gray",
			--     style = "bold",
			--   }
			-- end,
			left_sep = "block",
			right_sep = "block",
		}

		component.file_type = {
			provider = {
				name = "file_type",
				opts = {
					filetype_icon = true,
				},
			},
			hl = {
				fg = theme.ui.fg_dim,
				-- bg = "gray",
				bg = theme.ui.bg_m3,
			},
			left_sep = "block",
			right_sep = "block",
		}

		component.file_info = {
			provider = {
				name = "file_info",
				opts = {
					-- type = "relative-short",
					type = "short",
				},
			},
			hl = {
				fg = theme.ui.fg_dim,
				bg = theme.ui.bg_m3,
			},
			left_sep = "block",
			right_sep = "block",
		}
		component.scroll_bar = {
			provider = "scroll_bar",
			hl = {
				-- fg = "fg",
				-- bg = "bg",
				fg = theme.ui.fg_dim,
				bg = theme.ui.bg_m3,
			},
			-- provider = function()
			--   local chars = setmetatable({
			--     " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
			--     " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ", " ",
			--   }, { __index = function() return " " end })
			--   local line_ratio = vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0)
			--   local position = math.floor(line_ratio * 100)
			--
			--   local icon = chars[math.floor(line_ratio * #chars)] .. position
			--   if position <= 5 then
			--     icon = " TOP"
			--   elseif position >= 95 then
			--     icon = " BOT"
			--   end
			--   return icon
			-- end,
			-- hl = function()
			--   local position = math.floor(vim.api.nvim_win_get_cursor(0)[1] / vim.api.nvim_buf_line_count(0) * 100)
			--   local fg
			--   local style
			--
			--   if position <= 5 then
			--     fg = "aqua"
			--     style = "bold"
			--   elseif position >= 95 then
			--     fg = "red"
			--     style = "bold"
			--   else
			--     fg = "purple"
			--     style = nil
			--   end
			--   return {
			--     fg = fg,
			--     style = style,
			--     bg = "bg",
			--   }
			-- end,
			left_sep = "block",
			right_sep = "block",
		}

		local left = {
			component.vim_mode,
			component.file_info,
			component.file_type,
      component.space,
		}
		local middle = {
      component.space,
    }
		local right = {
			component.lsp,
			component.git_branch,
			component.git_add,
			component.git_delete,
			component.git_change,
			component.separator,
			component.diagnostic_errors,
			component.diagnostic_warnings,
			component.diagnostic_info,
			component.diagnostic_hints,
			component.scroll_bar,
		}

		local components = {
			active = { left, middle, right },
		}

		feline.setup({
			components = components,
			theme = theme,
			vi_mode_colors = mode_theme,
		})
	end,
}
