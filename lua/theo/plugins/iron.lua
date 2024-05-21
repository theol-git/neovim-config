return {
	"Vigemus/iron.nvim",
	main = "iron.core",
	cmd = {
		"IronRepl",
		"IronReplHere",
		"IronRestart",
		"IronSend",
		"IronFocus",
		"IronHide",
		"IronWatch",
		"IronAttach",
	},

	-- iron also has a list of commands, see :h iron-commands for all available commands
	keys = {
		{ "<leader>r", desc = "REPL" },
		{ "<leader>rs", "<cmd>IronRepl<cr>", desc = "Iron Repl" },
		{ "<leader>rr", "<cmd>IronRestart<cr>", desc = "Iron Restart" },
		{ "<leader>rr", "<cmd>IronFocus<cr>", desc = "Iron Focus" },
		{ "<leader>rh", "<cmd>IronHide<cr>", desc = "Iron Focus" },
	},
	opts = function()
		return {
			config = {
				-- Whether a repl should be discarded or not
				scratch_repl = true,
				-- Your repl definitions come here
				repl_definition = {
					sh = {
						-- Can be a table or a function that
						-- returns a table (see below)
						command = { "zsh" },
					},
					python = {
						-- Can be a table or a function that
						-- returns a table (see below)
						command = "ipython --no-autoindent",
					},
				},
				-- How the repl window will be displayed
				-- See below for more information
				repl_open_cmd = require("iron.view").split.vertical.botright("40%"),
			},
			-- Iron doesn't set keymaps by default anymore.
			-- You can set them here or manually add keymaps to the functions in iron.core
			keymaps = {
				send_motion = "<leader>rSc",
				visual_send = "<leader>rSc",
				send_file = "<leader>rSf",
				send_line = "<leader>rSl",
				send_paragraph = "<leader>rSp",
				send_until_cursor = "<leader>rSu",
				send_mark = "<leader>rSm",
				mark_motion = "<leader>rMc",
				mark_visual = "<leader>rMc",
				remove_mark = "<leader>rMd",
				interrupt = "<leader>rSi",
				exit = "<leader>rq",
				clear = "<leader>rc",
			},
			-- If the highlight is on, you can change how it looks
			-- For the available options, check nvim_set_hl
			highlight = {
				italic = true,
			},
			ignore_blank_lines = true, -- ignore blank lines when sending visual select lines
		}
	end,
}
