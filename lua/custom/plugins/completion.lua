return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	config = function()
		vim.keymap.set("i", "<C-g>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true })
		vim.keymap.set("i", "<C-a>a", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, desc = "Codeium Accept" })
		vim.keymap.set("i", "<C-a>n", function()
			vim.fn["codeium#CycleCompletions"](1)
		end, { desc = "Codeium Next Completion" })
		vim.keymap.set("i", "<C-a>p", function()
			vim.fn["codeium#CycleCompletions"](-1)
		end, { desc = "Codeium Previous Completion" })
		vim.keymap.set("i", "<C-a>x", function()
			vim.fn["codeium#Clear"]()
		end, { desc = "Codeium Clear" })
		vim.keymap.set("n", "<Leader>;", function()
			if vim.g.codeium_enabled == true then
				vim.cmd("CodeiumDisable")
			else
				vim.cmd("CodeiumEnable")
			end
		end, { noremap = true, desc = "Toggle Codeium active" })
	end,
}
