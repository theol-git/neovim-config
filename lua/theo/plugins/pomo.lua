return {
	"theol-git/pomo.nvim",
	--    version = "*",  -- Recommended, use latest release instead of latest commit
	--    commit = "0114f2b",
	lazy = true,
	cmd = { "TimerStart", "TimerRepeat" },
	dependencies = {
		-- Optional, but highly recommended if you want to use the "Default" timer
		"rcarriga/nvim-notify",
	},
	opts = {
		notifiers = {
			{ name = "System" },
		},
	},
}
