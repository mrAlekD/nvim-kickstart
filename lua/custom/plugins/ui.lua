local dressing = {
  'stevearc/dressing.nvim',
  opts = {},
}

local neotree = {
  'nvim-neo-tree/neo-tree.nvim',
  branch = 'v3.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
  },
  init = function()
    vim.keymap.set('n', '<leader>ntt', '<CMD>Neotree toggle<CR>', { noremap = true, silent = true, desc = 'NeoTree Toggle' })
    vim.keymap.set('n', '<leader>ntf', '<CMD>Neotree focus<CR>', { noremap = true, silent = true, desc = 'Focus NeoTree' })
  end,
}

local toggleterm = {
  'akinsho/toggleterm.nvim',
  version = '*',
  config = true,
  init = function()
    vim.keymap.set('n', '<F7>', '<CMD>ToggleTerm direction=float<CR>', { noremap = true, silent = true, desc = 'Float Term' })
    vim.keymap.set('n', '<leader>tf', '<CMD>ToggleTerm direction=float<CR>', { noremap = true, silent = true, desc = 'Float Term' })
    vim.keymap.set('n', '<leader>th', '<CMD>ToggleTerm direction=horizontal<CR>', { noremap = true, silent = true, desc = 'Horizontal Term' })
    vim.keymap.set('n', '<leader>tv', '<CMD>ToggleTerm direction=vertical<CR>', { noremap = true, silent = true, desc = 'Vertical Term' })
    vim.keymap.set('t', '<F7>', '<CMD>ToggleTerm<CR>', { noremap = true, silent = true, desc = 'Toggle Term' })

    local Terminal = require('toggleterm.terminal').Terminal
    local lazygit = Terminal:new { cmd = 'lazygit', hidden = true, direction = 'float' }
    vim.keymap.set('n', '<leader>gg', function()
      lazygit:toggle()
    end, { noremap = true, silent = true, desc = 'lazygit' })
  end,
}

return {
  dressing,
  neotree,
  toggleterm,
}
