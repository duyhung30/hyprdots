require("duyhung.core")
require("duyhung.lazy")

if vim.g.neovide then
	-- Put anything you want to happen only in Neovide here
	vim.o.guifont = "Iosevka Nerd Font:h14" -- text below applies for VimScript
	vim.g.neovide_scale_factor = 1.0
	vim.g.neovide_padding_top = 10
	vim.g.neovide_padding_bottom = 0
	vim.g.neovide_padding_right = 10
	vim.g.neovide_padding_left = 10
end
