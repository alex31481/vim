local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', function()
  local cword = vim.fn.expand('<cword>')
	builtin.grep_string({ search = vim.fn.input("Grep > "..cword) })
end)
vim.keymap.set('n', '<leader>tt', function()
  print(vim.fn.expand('<cword>'))
end)
vim.keymap.set('n', '<leader>vh', builtin.help_tags, {})
