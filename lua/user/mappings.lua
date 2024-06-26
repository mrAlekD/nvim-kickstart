-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Esc><CMD>write<CR>", { desc = "Save File" })
vim.keymap.set({ "n", "i", "v" }, "<C-q>", "<Esc><CMD>quit<CR>", { desc = "Quit File" })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
-- vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
-- vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>le", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>lq", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

vim.keymap.set({ "n", "v" }, "x", '"_x')
vim.keymap.set({ "n", "v" }, "<Tab>rh", '"_', { desc = "Empty hole" })
vim.keymap.set({ "n", "v" }, "<Tab>rr", '"', { desc = "Register" })
vim.keymap.set({ "n", "v" }, "<Tab>rc", '"+', { desc = "Clipboard register" })
vim.keymap.set({ "n", "v" }, "<Tab>q", "@", { desc = "Macro" })
vim.keymap.set({ "n", "v" }, "<Tab><Tab>", "<Tab>", { desc = "Tab", noremap = true })

vim.keymap.set("v", "J", function()
	return ":'<,'>m '>+" .. vim.v.count1 .. "<cr>gv=gv"
end, { desc = "Move text down", expr = true })
vim.keymap.set("v", "K", function()
	return ":'<,'>m '<-" .. (vim.v.count1 + 1) .. "<cr>gv=gv"
end, { desc = "Move text up", expr = true })

vim.keymap.set(
	"n",
	"[<Space>",
	'<cmd>call append(line(".")-1, repeat([""], v:count1))<cr>',
	{ desc = "Add a line above" }
)
vim.keymap.set(
	"n",
	"]<Space>",
	'<cmd>call append(line("."), repeat([""], v:count1))<cr>',
	{ desc = "Add a line below" }
)
vim.keymap.set("n", "+", "<C-a>")
vim.keymap.set("n", "-", "<C-x>")
vim.keymap.set("n", "<M-o>", "<C-I>", { noremap = true })
vim.keymap.set("n", "]b", "<cmd>bn<cr>", { desc = "Next buffer" })
vim.keymap.set("n", "[b", "<cmd>bp<cr>", { desc = "Previous buffer" })
vim.keymap.set("n", "<leader>c", "<cmd>bd<cr>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>;s", function()
	vim.opt.scrolloff = 999 - vim.o.scrolloff
end, { desc = "Toggle scrolloff" })

vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" })
