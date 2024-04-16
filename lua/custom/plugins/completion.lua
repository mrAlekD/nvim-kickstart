return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	init = function()
		vim.g.codeium_no_map_tab = 1
		vim.keymap.set("i", "<C-g>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<C-a>a", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, desc = "Codeium Accept", silent = true })
		vim.keymap.set("i", "<C-a>n", function()
			vim.fn["codeium#CycleCompletions"](1)
		end, { desc = "Codeium Next Completion", silent = true })
		vim.keymap.set("i", "<C-a>p", function()
			vim.fn["codeium#CycleCompletions"](-1)
		end, { desc = "Codeium Previous Completion", silent = true })
		vim.keymap.set("i", "<C-a>c", function()
			vim.fn["codeium#Clear"]()
		end, { desc = "Codeium Clear", silent = true })
		vim.keymap.set("i", "<C-a>t", function()
			vim.fn["codeium#Complete"]()
		end, { desc = "Codeium Trigger", silent = true })
		vim.keymap.set("n", "<Leader>;", function()
			if vim.g.codeium_enabled == true then
				vim.cmd("CodeiumDisable")
			else
				vim.cmd("CodeiumEnable")
			end
		end, { noremap = true, desc = "Toggle Codeium active" })
	end,
}
