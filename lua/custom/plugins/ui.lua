local dressing = {
	"stevearc/dressing.nvim",
	opts = {},
}

local undotree = {
	"mbbill/undotree",
	event = "BufEnter",
	init = function()
		vim.keymap.set(
			"n",
			"<leader>uu",
			vim.cmd.UndotreeToggle,
			{ noremap = true, silent = true, desc = "Undotree Toggle" }
		)
		vim.keymap.set(
			"n",
			"<leader>uf",
			vim.cmd.UndotreeFocus,
			{ noremap = true, silent = true, desc = "Undotree Focus" }
		)
	end,
}

local toggleterm = {
	"akinsho/toggleterm.nvim",
	version = "*",
	config = true,
	init = function()
		vim.keymap.set(
			"n",
			"<F7>",
			"<CMD>ToggleTerm direction=float<CR>",
			{ noremap = true, silent = true, desc = "Float Term" }
		)
		vim.keymap.set(
			"n",
			"<leader>tf",
			"<CMD>ToggleTerm direction=float<CR>",
			{ noremap = true, silent = true, desc = "Float Term" }
		)
		vim.keymap.set(
			"n",
			"<leader>th",
			"<CMD>ToggleTerm direction=horizontal<CR>",
			{ noremap = true, silent = true, desc = "Horizontal Term" }
		)
		vim.keymap.set(
			"n",
			"<leader>tv",
			"<CMD>ToggleTerm direction=vertical<CR>",
			{ noremap = true, silent = true, desc = "Vertical Term" }
		)
		vim.keymap.set("t", "<F7>", "<CMD>ToggleTerm<CR>", { noremap = true, silent = true, desc = "Toggle Term" })

		local Terminal = require("toggleterm.terminal").Terminal
		local lazygit = Terminal:new({ cmd = "lazygit", hidden = true, direction = "float" })
		vim.keymap.set("n", "<leader>gg", function()
			lazygit:toggle()
		end, { noremap = true, silent = true, desc = "lazygit" })
	end,
}

local harpoon = {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = true,
	init = function()
		local harpoon = require("harpoon")
		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Add currect buffer", silent = true })
		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end, { desc = "Open harpoon", silent = true })

		vim.keymap.set("n", "<leader>hn", function()
			harpoon:list():next()
		end, { desc = "Next element", silent = true })
		vim.keymap.set("n", "<leader>hp", function()
			harpoon:list():prev()
		end, { desc = "Previous element", silent = true })

		for idx = 1, 8 do
			vim.keymap.set("n", "<leader>h" .. idx, function()
				harpoon:list():select(idx)
			end, { desc = "Select element" .. idx, silent = true })
		end
	end,
}

return {
	dressing,
	undotree,
	toggleterm,
	harpoon,
}
