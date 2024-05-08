-- This file  needs to have same structure as nvconfig.lua 
-- https://github.com/NvChad/NvChad/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
	theme = "tokyonight",

  changed_themes = {
		tokyonight = {
			base_30 = {
				black = "#24283b",
				darker_black = "#1f2336",
				statusline_bg = "#1f2336",
				black2 = "#292e41",
			},
			base_16 = {
				base00 = "#24283b",
				base01 = "#1f2336",
			},
		},
	},

	hl_override = {
		CursorLine = {
			bg = "#292e41",
		},
		ColorColumn = {
			bg = "#292e41",
		},
	},

	-- hl_override = {
	-- 	Comment = { italic = true },
	-- 	["@comment"] = { italic = true },
	-- },
}

return M
