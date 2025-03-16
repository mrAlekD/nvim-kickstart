local dressing = {
	"stevearc/dressing.nvim",
	-- event = "VeryLazy", -- breaks ui for some reason
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
	event = "VimEnter",
	cmd = { "ToggleTerm", "ToggleTermToggleAll" },
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
	event = "VeryLazy",
	cmd = { "Harpoon" },
	dependencies = { "nvim-lua/plenary.nvim" },
	config = true,
	init = function()
		local harpoon = require("harpoon")
		local hopen = function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end

		vim.api.nvim_create_user_command("Harpoon", hopen, {})
		vim.keymap.set("n", "<leader>hh", hopen, { desc = "Open harpoon", silent = true })

		vim.keymap.set("n", "<leader>ha", function()
			harpoon:list():add()
		end, { desc = "Add currect buffer", silent = true })

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

local whichkey = { -- Useful plugin to show you pending keybinds.
	"folke/which-key.nvim",
	event = "VeryLazy", -- Sets the loading event to 'VimEnter'
	config = true,
	init = function()
		-- require("which-key").register({
		-- 	["<leader>d"] = { name = "[D]ebug", _ = "which_key_ignore" },
		-- 	["<leader>g"] = { name = "[G]it", _ = "which_key_ignore" },
		-- 	["<leader>h"] = { name = "[H]arpoon", _ = "which_key_ignore" },
		-- 	["<leader>l"] = { name = "[L]sp", _ = "which_key_ignore" },
		-- 	["<leader>f"] = { name = "[F]ind", _ = "which_key_ignore" },
		-- 	["<leader>t"] = { name = "[T]erminal", _ = "which_key_ignore" },
		-- 	["<leader>u"] = { name = "[U]ndoTree", _ = "which_key_ignore" },
		-- 	["<leader>;"] = { name = "Toggles", _ = "which_key_ignore" },
		-- 	["<Tab>"] = { name = "My menu", _ = "which_key_ignore" },
		-- 	["<Tab>r"] = { name = "[R]egisters", _ = "which_key_ignore" },
		-- 	["<Tab>s"] = { name = "[S]urround", _ = "which_key_ignore" },
		-- })
		--
		local wk = require("which-key")
		wk.add({
			{ "<leader>d", group = "[D]ebug" },
			{ "<leader>g", group = "[G]it" },
			{ "<leader>h", group = "[H]arpoon" },
			{ "<leader>l", group = "[L]sp" },
			{ "<leader>f", group = "[F]ind" },
			{ "<leader>t", group = "[T]erminal" },
			{ "<leader>u", group = "[U]ndoTree" },
			{ "<leader>;", group = "Toggles" },
			{ "<Tab>", group = "My menu" },
			{ "<Tab>r", group = "[R]egisters" },
			{ "<Tab>s", group = "[S]urround" },
		})
	end,
}

return {
	dressing,
	undotree,
	toggleterm,
	harpoon,
	whichkey,
}
