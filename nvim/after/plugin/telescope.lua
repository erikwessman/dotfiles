local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<C-f>', function()
    -- need to have ripgrep installed
	builtin.grep_string({ search = vim.fn.input("Grep > ")});
end)
vim.keymap.set('n', '<leader>gu', ':lua require("telescope.builtin").lsp_references()<CR>', { noremap = true, silent = true })
