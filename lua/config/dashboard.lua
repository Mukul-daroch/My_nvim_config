local alpha = require("alpha") -- Load the alpha-nvim plugin
local dashboard = require("alpha.themes.dashboard")
require("alpha").setup(require("alpha.themes.dashboard").config)
-- Create an autocmd group to manage alpha dashboard events
vim.api.nvim_create_augroup("AlphaDashboard", { clear = true })

-- ------------------------------------------------------------------------
-- Autocommand to hide statusline when alpha is active
vim.api.nvim_create_autocmd("FileType", {
	pattern = "alpha",
	group = "AlphaDashboard",
	callback = function()
		-- Hide the statusline by setting laststatus to 0
		vim.opt.laststatus = 0
		-- Optional: You can also clear the statusline text
		vim.opt_local.statusline = ""
		vim.cmd([[
	highlight Normal guibg=NONE ctermbg=NONE
	highlight EndOfBuffer guibg=NONE ctermbg=NONE
	]]) -- Transparent background
	end,
})
-- Autocommand to restore the statusline when leaving alpha
vim.api.nvim_create_autocmd("BufUnload", {
	pattern = "<buffer>",
	group = "AlphaDashboard",
	callback = function()
		vim.opt.laststatus = 2 -- Restore laststatus to its default value
		vim.cmd([[
	highlight Normal guibg=#1e1e1e ctermbg=0
	highlight EndOfBuffer guibg=#1e1e1e ctermbg=0
	]]) -- Restore background color to default
		-- Optionally, reapply your colorscheme to reset all highlights
		--	highlight Normal guibg=#000000 ctermbg=0
		--	highlight EndOfBuffer guibg=#000000 ctermbg=0
		--	]]
	end,
})
-- ------------------------------------------------------------------------

-- ----------------------------------------------------------------------------------------------------------------------------------------------------

local space = "   "
local header_movement = 30 -- this moves the header towards right
local a = string.rep(space, header_movement)
-- ------------------------------------------------------------------------
-- Set the header
dashboard.section.header.val = {
	a
		.. " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣠⣼⠂⠀⠀⠀⠀⠙⣦⢀⠀⠀⠀⠀⠀⢶⣤⣀⣀⣀⣀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀          ",
	a
		.. " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣶⣿⣿⣿⣿⣿⣿⣿⣿⠷⢦⠀⣹⣶⣿⣦⣿⡘⣇⠀⠀⠀⢰⠾⣿⣿⣿⣟⣻⣿⣿⣿⣷⣦⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ",
	a
		.. " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⠀⠀⢺⣿⣿⣿⣿⣿⣿⣿⣆⠀⠀⠀⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣦⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀  ",
	a
		.. " ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣴⢟⣥⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡇⠀⠀⠀⠀⢻⣿⣿⡏⢹⣿⣿⣿⣿⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣮⣝⢷⣄⠀⠀⠀⠀⠀⠀⠀  ",
	a
		.. " ⠀⠀⠀⠀⠀⠀⠀⣴⣿⣿⣿⣿⣿⣿⣿⣿⣿⡿⢛⣿⣿⣿⡇⠀⠀⠀⠀⠛⣿⣿⣷⡀⠘⢿⣧⣻⡷⠀⠀⠀⠀⠀⠀⣿⣿⣿⣟⢿⣿⣿⣿⣿⣿⣿⣿⣿⣝⢧⡀⠀⠀⠀⠀⠀  ",
	a
		.. " ⠀⠀⠀⠀⠀⢠⣾⣿⠟⣡⣾⣿⣿⣧⣿⡿⣋⣴⣿⣿⣿⣿⣧⠀⠀⠀⠀⠀⢻⣿⣿⣿⣶⡄⠙⠛⠁⠀⠀⠀⠀⠀⢸⣿⣿⣿⣿⣷⣝⢻⣿⣟⣿⣿⣷⣮⡙⢿⣽⣆⠀⠀⠀⠀  ",
	a
		.. " ⠀⠀⠀⠀⢀⡿⢋⣴⣿⣿⣿⣿⣿⣼⣯⣾⣿⣿⡿⣻⣿⣿⣿⣦⠀⠀⠀⠀⢀⣹⣿⣿⣿⣿⣶⣤⠀⠀⠀⠀⠀⣰⣿⣿⣿⣿⠻⣿⣿⣿⣮⣿⣿⣿⣿⣿⣿⣦⡙⢿⣇⠀⠀⠀  ",
	a
		.. " ⠀⠀⠀⣠⡏⣰⣿⣿⡿⢿⣿⣿⣿⣿⣿⣿⡿⢋⣼⣿⣿⣿⣿⣿⣷⡤⠀⣠⣿⣿⣿⣿⣿⣿⣿⣿⣷⣄⠀⢠⣾⣿⣿⣿⣿⣿⣷⡜⢿⣿⣿⣿⣿⣿⣿⡿⠿⣿⣿⣦⡙⣦  ⠀ ",
	a
		.. " ⠀⠀⣰⢿⣿⣿⠟⠋⣠⣾⣿⣿⣿⣿⣿⠛⢡⣾⡿⢻⣿⣿⣿⣿⣿⣿⣿⣿⡿⠋⠻⣿⡟⣿⣿⣿⠻⢿⣿⣿⣿⣿⣿⣿⣿⣟⠻⣿⣆⠙⢿⣿⣿⣿⣿⣿⣦⡈⠻⣿⣿⣟⣧ ⠀ ",
	a
		.. " ⠀⣰⢣⣿⡿⠃⣠⡾⠟⠁⠀⣸⣿⡟⠁⢀⣿⠋⢠⣿⡏⣿⣿⣿⣿⣿⢿⠁⢀⣠⣴⢿⣷⣿⣿⣿⠀⠀⠽⢻⣿⣿⣿⣿⡼⣿⡇⠈⢿⡆⠀⠻⣿⣧⠀⠈⠙⢿⣆⠈⠻⣿⣎⢧  ",
	a
		.. " ⠀⢣⣿⠟⢀⡼⠋⠀⠀⢀⣴⠿⠋⠀⠀⣾⡟⠀⢸⣿⠙⣿⠃⠘⢿⡟⠀⣰⢻⠟⠻⣿⣿⣿⣿⣿⣀⠀⠀⠘⣿⠋⠀⣿⡇⣿⡇⠀⠸⣿⡄⠀⠈⠻⣷⣄⠀⠀⠙⢷⡀⠙⣿⣆  ",
	a
		.. " ⢀⣿⡏⠀⡞⠁⢀⡠⠞⠋⠁⠀⠀⠀⠈⠉⠀⠀⠀⠿⠀⠈⠀⠀⠀⠀⠀⣿⣿⣰⣾⣿⣿⣿⣿⣿⣿⣤⠀⠀⠀⠀⠀⠉⠀⠸⠃⠀⠀⠈⠋⠀⠀⠀⠀⠙⠳⢤⣀⠀⠹⡄⠘⣿⡄ ",
	a
		.. " ⣸⡟⠀⣰⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠛⠿⠿⠿⠟⠁⠀⠹⣿⣷⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣿⣧⠀⢹⣷ ",
	a
		.. " ⣿⠃⢠⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣄⣤⣀⠀⠀⣿⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢻⡇⠀⣿ ",
	a
		.. " ⣿⠀⢸⠅⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⠋⠉⢻⣧⢀⣿⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⢸ ",
	a
		.. " ⡇⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢿⣧⡀⠀⠀⣿⣾⡟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⢸ ",
	a
		.. " ⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⠿⣿⣿⠟⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡾ ",
	a
		.. " ⠈⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⡿⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠃ ",
	a
		.. " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀ ",
	a
		.. " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠘⣧⢀⣾⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀ ",
	a
		.. " ⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⡼⣿⣿⣾⣤⣠⡼⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ⠀ ",
}
-- ------------------------------------------------------------------------
dashboard.config.layout = {
	{ type = "padding", val = 2 }, -- moves header toward bottam
	dashboard.section.header,
	{ type = "padding", val = 1 }, -- moves buttons toward bottam
	dashboard.section.buttons,
	{ type = "padding", val = 2 }, -- moves footer toward bottam
	dashboard.section.footer,
}
-- ------------------------------------------------------------------------
dashboard.section.header.opts = {
	position = "center", -- Options: "center", "left", "right"
}
-- ------------------------------------------------------------------------
-- -X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X--X-
-- ------------------------------------------------------------------------
-- Centered buttons (default)
dashboard.section.buttons.val = {
	dashboard.button("f", " Find file", ":Telescope find_files<CR>"),
	dashboard.button("r", " Recently used files", ":Telescope oldfiles<CR>"),
	dashboard.button("e", " New file", ":ene <BAR> startinsert <CR>"),
	dashboard.button("q", " Quit", ":qa<CR>"),
}
-- ------------------------------------------------------------------------
-- Adjust buttons to the left
dashboard.section.buttons.opts = {
	position = "left", -- default is "center"
	margin = 0, -- add a margin to shift the buttons to the left
}
-- Adjust buttons to the right
dashboard.section.buttons.opts = {
	position = "right",
	margin = 0, -- add a margin to shift the buttons to the right
}
-- ------------------------------------------------------------------------
--	{ action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
--	{ action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
--	{ action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
--	{ action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
--	{ action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
--	{ action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
--	{ action = "LazyExtras",                                     desc = " Lazy Extras",     icon = " ", key = "x" },
--	{ action = "Lazy",                                           desc = " Lazy",             key = "l" },
--	{ action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",             key = "q" },
-- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- You can also add padding if needed to adjust the buttons
local function pad(str)
	return string.rep(" ", 0) .. str
end

dashboard.section.buttons.val = vim.tbl_map(function(button)
	return { type = "button", val = pad(button.val), on_press = button.on_press }
end, dashboard.section.buttons.val)

-- Apply the configuration
alpha.setup(dashboard.config)
-- ----------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------------------------------------------------------------------------------------------------------------
