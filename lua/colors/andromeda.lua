local M = {}

M.colors = {
	-- General UI Colors
	border = "#2b2f38",
	border_variant = "#252931",
	border_focused = "#183934",
	border_selected = "#183934",
	border_disabled = "#292d37",
	elevated_surface_background = "#21242b",
	surface_background = "#21242b",
	background = "#262933",
	element_background = "#21242b",
	element_hover = "#252931",
	element_active = "#2a2f39",
	element_selected = "#2a2f39",
	element_disabled = "#21242b",
	drop_target_background = "#aca8ae80",
	ghost_element_background = "#00000000",
	ghost_element_hover = "#252931",
	ghost_element_active = "#2a2f39",
	ghost_element_selected = "#2a2f39",
	ghost_element_disabled = "#21242b",
	text = "#f7f7f8",
	text_muted = "#aca8ae",
	text_placeholder = "#6b6b73",
	text_disabled = "#6b6b73",
	text_accent = "#10a793",
	icon = "#f7f7f8",
	icon_muted = "#aca8ae",
	icon_disabled = "#6b6b73",
	icon_placeholder = "#aca8ae",
	icon_accent = "#10a793",
	status_bar_background = "#262933",
	title_bar_background = "#262933",
	title_bar_inactive_background = "#21242b",
	toolbar_background = "#1e2025",
	tab_bar_background = "#21242b",
	tab_inactive_background = "#21242b",
	tab_active_background = "#1e2025",
	search_match_background = "#11a79366",
	panel_background = "#21242b",
	scrollbar_thumb_background = "#f7f7f84c",
	scrollbar_thumb_hover_background = "#252931",
	scrollbar_thumb_border = "#252931",
	scrollbar_track_background = "#00000000",
	scrollbar_track_border = "#21232a",
	editor_foreground = "#f7f7f8",
	editor_background = "#1e2025",
	editor_gutter_background = "#1e2025",
	editor_subheader_background = "#21242b",
	editor_active_line_background = "#21242bbf",
	editor_highlighted_line_background = "#21242b",
	editor_line_number = "#f7f7f859",
	editor_active_line_number = "#f7f7f8",
	editor_invisible = "#64646d",
	editor_wrap_guide = "#f7f7f80d",
	editor_active_wrap_guide = "#f7f7f81a",
	editor_document_highlight_read_background = "#10a7931a",
	editor_document_highlight_write_background = "#64646d66",
	terminal_background = "#1e2025",
	terminal_foreground = "#f7f7f8",
	terminal_bright_foreground = "#f7f7f8",
	terminal_dim_foreground = "#1e2025",
	-- Terminal ANSI Colors
	ansi_black = "#1e2025",
	ansi_bright_black = "#40434c",
	ansi_dim_black = "#f7f7f8",
	ansi_red = "#f82871",
	ansi_bright_red = "#8e0f3a",
	ansi_dim_red = "#ffa3b5",
	ansi_green = "#96df71",
	ansi_bright_green = "#457c38",
	ansi_dim_green = "#cef0b9",
	ansi_yellow = "#fee56c",
	ansi_bright_yellow = "#958334",
	ansi_dim_yellow = "#fef1b7",
	ansi_blue = "#10a793",
	ansi_bright_blue = "#1a5148",
	ansi_dim_blue = "#9cd4c7",
	ansi_magenta = "#c74cec",
	ansi_bright_magenta = "#682681",
	ansi_dim_magenta = "#e7abf7",
	ansi_cyan = "#08e7c5",
	ansi_bright_cyan = "#008169",
	ansi_dim_cyan = "#a9f4e1",
	ansi_white = "#f7f7f8",
	ansi_bright_white = "#f7f7f8",
	ansi_dim_white = "#87858c",
	link_text_hover = "#10a793",
	conflict = "#fee56c",
	conflict_background = "#5c5014",
	conflict_border = "#796b26",
	created = "#96df71",
	created_background = "#184618",
	created_border = "#306129",
	deleted = "#f82871",
	deleted_background = "#54051b",
	deleted_border = "#72092a",
	error = "#f82871",
	error_background = "#54051b",
	error_border = "#72092a",
	hidden = "#6b6b73",
	hidden_background = "#262933",
	hidden_border = "#292d37",
	hint = "#618399",
	hint_background = "#12231f",
	hint_border = "#183934",
	ignored = "#6b6b73",
	ignored_background = "#262933",
	ignored_border = "#2b2f38",
	info = "#10a793",
	info_background = "#12231f",
	info_border = "#183934",
	modified = "#fee56c",
	modified_background = "#5c5014",
	modified_border = "#796b26",
	predictive = "#315f70",
	predictive_background = "#184618",
	predictive_border = "#306129",
	renamed = "#10a793",
	renamed_background = "#12231f",
	renamed_border = "#183934",
	success = "#96df71",
	success_background = "#184618",
	success_border = "#306129",
	unreachable = "#aca8ae",
	unreachable_background = "#262933",
	unreachable_border = "#2b2f38",
	warning = "#fee56c",
	warning_background = "#5c5014",
	warning_border = "#796b26",
}

M.setup = function()
	local c = M.colors

	-- Set the background and foreground
	vim.o.background = "dark"
	vim.o.termguicolors = true

	-- Define highlight groups
	local highlight = function(group, properties)
		local cmd = "highlight " .. group
		if properties.fg then
			cmd = cmd .. " guifg=" .. properties.fg
		end
		if properties.bg then
			cmd = cmd .. " guibg=" .. properties.bg
		end
		if properties.style then
			cmd = cmd .. " gui=" .. properties.style
		end
		vim.cmd(cmd)
	end

	-- Basic UI Elements
	highlight("Normal", { fg = c.editor_foreground, bg = c.editor_background })
	highlight("Cursor", { fg = c.background, bg = c.text_accent })
	highlight("CursorLine", { bg = c.editor_active_line_background })
	highlight(
		"CursorLineNr",
		{ fg = c.editor_active_line_number, bg = c.editor_active_line_background, style = "bold" }
	)
	highlight("Comment", { fg = c.text_muted, style = "italic" })
	highlight("Constant", { fg = c.text_accent })
	highlight("String", { fg = c.string })
	highlight("Character", { fg = c.string })
	highlight("Number", { fg = c.number })
	highlight("Boolean", { fg = c.boolean })
	highlight("Float", { fg = c.number })
	highlight("Identifier", { fg = c.variable })
	highlight("Function", { fg = c.function_color })
	highlight("Statement", { fg = c.keyword })
	highlight("Conditional", { fg = c.keyword })
	highlight("Repeat", { fg = c.keyword })
	highlight("Label", { fg = c.label })
	highlight("Operator", { fg = c.operator })
	highlight("Keyword", { fg = c.keyword })
	highlight("Exception", { fg = c.keyword })
	highlight("PreProc", { fg = c.preproc })
	highlight("Type", { fg = c.type })
	highlight("StorageClass", { fg = c.keyword })
	highlight("Structure", { fg = c.type })
	highlight("Typedef", { fg = c.type })
	highlight("Special", { fg = c.special })
	highlight("SpecialChar", { fg = c.special })
	highlight("Tag", { fg = c.tag })
	highlight("Delimiter", { fg = c.punctuation })
	highlight("SpecialComment", { fg = c.comment })
	highlight("Debug", { fg = c.warning })

	-- Additional Syntax Highlighting
	highlight("Attribute", { fg = c.attribute })
	highlight("Constructor", { fg = c.constructor })
	highlight("Emphasis", { fg = c.emphasis })
	highlight("Enum", { fg = c.enum })
	highlight("Hint", { fg = c.hint, style = "bold" })
	highlight("LinkText", { fg = c.link_text_hover, style = "underline" })
	highlight("LinkURI", { fg = c.link_uri })
	highlight("Predictive", { fg = c.predictive, style = "italic" })
	highlight("Title", { fg = c.title, style = "bold" })
	highlight("Variable", { fg = c.variable })

	-- Terminal ANSI Colors
	vim.g.terminal_color_0 = c.ansi_black
	vim.g.terminal_color_1 = c.ansi_red
	vim.g.terminal_color_2 = c.ansi_green
	vim.g.terminal_color_3 = c.ansi_yellow
	vim.g.terminal_color_4 = c.ansi_blue
	vim.g.terminal_color_5 = c.ansi_magenta
	vim.g.terminal_color_6 = c.ansi_cyan
	vim.g.terminal_color_7 = c.ansi_white
	vim.g.terminal_color_8 = c.ansi_bright_black
	vim.g.terminal_color_9 = c.ansi_bright_red
	vim.g.terminal_color_10 = c.ansi_bright_green
	vim.g.terminal_color_11 = c.ansi_bright_yellow
	vim.g.terminal_color_12 = c.ansi_bright_blue
	vim.g.terminal_color_13 = c.ansi_bright_magenta
	vim.g.terminal_color_14 = c.ansi_bright_cyan
	vim.g.terminal_color_15 = c.ansi_bright_white

	-- UI Components
	highlight("StatusLine", { fg = c.text, bg = c.status_bar_background })
	highlight("TabLine", { fg = c.text_muted, bg = c.tab_bar_background })
	highlight("TabLineSel", { fg = c.text, bg = c.tab_active_background })
	highlight("VertSplit", { fg = c.border_variant, bg = "NONE" })
	highlight("SignColumn", { fg = "NONE", bg = c.editor_background })
	highlight("Folded", { fg = c.text_muted, bg = c.editor_background })
	highlight("FoldColumn", { fg = c.text_muted, bg = c.editor_background })
	highlight("LineNr", { fg = c.editor_line_number, bg = c.editor_background })
	highlight("CursorColumn", { bg = c.editor_active_line_background })
	highlight("CursorLineFold", { bg = c.editor_active_line_background })

	-- Plugin-specific highlights can be added here

	-- You can add more highlight groups as needed to match the Zed theme
end

return M
