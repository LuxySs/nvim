local map = vim.keymap.set

map('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'Clear search highlights' })

-- Remap for dealing with word wrap
map('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
map('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Window resizing
map('n', '<A-k>', ':resize +5<CR>', { desc = 'Increase window height' })
map('n', '<A-j>', ':resize -5<CR>', { desc = 'Decrease window height' })
map('n', '<A-h>', ':vertical resize -5<CR>', { desc = 'Decrease window width' })
map('n', '<A-l>', ':vertical resize +5<CR>', { desc = 'Increase window width' })

-- Move lines up/down
map('n', '<A-J>', ':m .+1<CR>==', { desc = 'Move line down' })
map('n', '<A-K>', ':m .-2<CR>==', { desc = 'Move line up' })
map('v', '<A-J>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', '<A-K>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- Better indenting in visual mode
map('v', '<', '<gv', { desc = 'Indent left and reselect' })
map('v', '>', '>gv', { desc = 'Indent right and reselect' })

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Clipboard keymaps
map({ 'n', 'x' }, '<leader>d', '"_d', { desc = 'Delete without yanking' })
map({ 'n', 'x' }, '<leader>y', '"+y', { noremap = true, silent = true, desc = 'Yank to clipboard' })
map({ 'n', 'x' }, '<leader>Y', '"+yy', { noremap = true, silent = true, desc = 'Yank line to clipboard' })
map(
  'x',
  '<leader>P',
  '"_dP',
  { noremap = true, silent = true, desc = 'Paste over selection without erasing unnamed register' }
)

-- Keymap to toggle diagnostics virtual lines
map('n', '<leader>vl', function()
  local current = vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({
    virtual_lines = not current,
  })
end, { desc = 'Toggle [V]irtual [L]ines' })

-- Copy Full File-Path
map('n', '<leader>pa', function()
  local path = vim.fn.expand('%:p')
  vim.fn.setreg('+', path)
  print('file:', path)
end)

-- Copy Relative File-Path
map('n', '<leader>pr', function()
  local path = vim.fn.expand('%:.')
  vim.fn.setreg('+', path)
  print('file:', path)
end)
