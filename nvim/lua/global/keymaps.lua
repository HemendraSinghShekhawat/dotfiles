return {
  { 'n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'nohlsearch' } },
  { 'n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' } },
  { 'n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' } },
  { 'n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' } },
  { 't', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' } },
  { 'n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' } },
  { 'n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' } },
  { 'n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' } },
  { 'n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' } },
  { 'n', '<C-t>', '<cmd>Neotree toggle<cr>', { desc = '[S]earch [H]elp' } },
  -- vim.keymap.set("i", "^H", "<C-W>", { noremap = true, silent = true })
  -- {
  --   'n',
  --   '<leader>p',
  --   function()
  --     -- local user_input = vim.fn.input 'Enter input: '
  --     local register_a_content = vim.fn.getreg '%'
  --     print(register_a_content)
  --     vim.cmd('!wezterm imgcat ' .. register_a_content)
  --     -- local row, col = unpack(vim.api.nvim_win_get_cursor(0))
  --     -- vim.api.nvim_buf_set_text(0, row - 1, col, row - 1, col, { '_{' .. user_input .. '}' })
  --   end,
  --   { desc = 'open and show image' },
  -- },
  -- '<cmd>!wezterm imgcat<cr>', { desc = 'open and show image' } },
  -- { 'n', '<C-t>', '<cmd>NERDTreeToggle<CR>', { desc = 'open nerd tree' } },
}

-- keymap('n', '<Esc>', '<cmd>nohlsearch<CR>')
-- keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- Diagnostic keymaps
-- keymap('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous [D]iagnostic message' })
-- keymap('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next [D]iagnostic message' })
-- keymap('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Show diagnostic [E]rror messages' })
-- keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
--
-- keymap('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

--
--  See `:help wincmd` for a list of all window commands
-- keymap('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
-- keymap('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
-- keymap('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
-- keymap('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })
