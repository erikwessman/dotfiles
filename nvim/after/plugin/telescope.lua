local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-f>', function()
    -- need to have ripgrep installed
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
vim.keymap.set('n', 'gu', ':lua require("telescope.builtin").lsp_references()<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>sp', builtin.live_grep, {})
vim.keymap.set('n', '<leader>sf', builtin.find_files, {})
vim.keymap.set('n', '<leader>ff', builtin.oldfiles, {})
vim.keymap.set('n', '<leader>fs', builtin.lsp_document_symbols, {})
vim.keymap.set('n', '<leader>gb', builtin.git_branches, {})
vim.keymap.set('n', '<leader>gl', builtin.git_commits, {})
