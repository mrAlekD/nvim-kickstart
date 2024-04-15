local dressing = {
	"stevearc/dressing.nvim",
	opts = {},
}

local neotree = {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
		"MunifTanjim/nui.nvim",
		-- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
	},
	opts = {
		filesystem = {
			hijack_netrw_behavior = "open_current",
		},
		window = {
			mappings = {
				["e"] = function()
					vim.cmd("Neotree focus filesystem left")
				end,
				["b"] = function()
					vim.cmd("Neotree focus buffers left")
				end,
				["g"] = function()
					vim.cmd("Neotree focus git_status left")
				end,
			},
		},
		event_handlers = {
			{
				event = "file_opened",
				handler = function()
					require("neo-tree.command").execute({ action = "close" })
				end,
			},
		},
	},
	init = function()
		vim.keymap.set(
			"n",
			"<leader>e",
			"<CMD>Neotree toggle<CR>",
			{ noremap = true, silent = true, desc = "NeoTree Toggle" }
		)
		vim.keymap.set(
			"n",
			"<leader>o",
			"<CMD>Neotree focus<CR>",
			{ noremap = true, silent = true, desc = "Focus NeoTree" }
		)
	end,
}

local undotree = {
	"mbbill/undotree",
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
		end)
		vim.keymap.set("n", "<leader>hh", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<leader>h1", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>h2", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>h3", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>h4", function()
			harpoon:list():select(4)
		end)
	end,
}

return {
	dressing,
	neotree,
	undotree,
	toggleterm,
	harpoon,
}
