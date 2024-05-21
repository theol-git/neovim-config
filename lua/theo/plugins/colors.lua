function SetTheme(color)
	color = color or "rose-pine"
	vim.cmd.colorscheme(color)
end

return {
	{
		"folke/tokyonight.nvim",
		main = "tokyonight",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			style = "moon", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			transparent = true, -- Enable this to disable setting the background color
			terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
			styles = {
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				comments = { italic = false },
				keywords = { italic = false },
				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "dark", -- style for sidebars, see below
				floats = "dark", -- style for floating windows
			},
		},
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		opts = {},
		config = function()
			SetTheme()
		end,
	},
}
