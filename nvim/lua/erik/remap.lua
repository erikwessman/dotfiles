vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- Move blocks in insert mode
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Paste without yanking
vim.keymap.set("x", "<leader>p", [["_dP]])

-- Delete without yanking
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- Copy into system clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Newline but stay in normal mode
vim.keymap.set("n", "<S-O>", "o<Esc>k")

-- Select everything
vim.keymap.set("n", "<C-a>", "ggVG")

-- Yank to last character of line
vim.keymap.set("n", "Y", "yg_")

-- NvimTree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

vim.keymap.set("i", "<C-c>", "<Esc>")

-- Move between windows/tabs
vim.keymap.set('n', '<C-h>', '<C-w>h')
vim.keymap.set('n', '<C-j>', '<C-w>j')
vim.keymap.set('n', '<C-k>', '<C-w>k')
vim.keymap.set('n', '<C-l>', '<C-w>l')

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)

-- --- IntelliJ .ideavimrc Alignment Mappings ---

-- Exit insert mode with C-k
vim.keymap.set("i", "<C-k>", "<Esc>")

-- Search in visually selected text
vim.keymap.set("v", "//", [[y/\V<C-R>=escape(@",'/\')<CR><CR>]], { noremap = true })

-- Clear search highlights with ESC
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>", { silent = true })

-- Tab switching / Buffer switching (using native gt / gT; commented out <TAB> to preserve standard <C-i> jump navigation)
-- vim.keymap.set("n", "<TAB>", "<cmd>tabnext<CR>")
-- vim.keymap.set("n", "<S-TAB>", "<cmd>tabprevious<CR>")
vim.keymap.set("n", "gt", "<cmd>tabnext<CR>")
vim.keymap.set("n", "gT", "<cmd>tabprevious<CR>")

-- Window/Split Management
vim.keymap.set("n", "<leader>ww", "<cmd>q<CR>")
vim.keymap.set("n", "<leader>wv", "<C-w>v")
vim.keymap.set("n", "<leader>wh", "<C-w>s")
vim.keymap.set("n", "<leader>wu", "<C-w>o")
vim.keymap.set("n", "<leader>wm", "<C-w>_|<C-w>\\|")

-- Go to Code
vim.keymap.set("n", "gp", "<C-o>")
vim.keymap.set("n", "gn", "<C-i>")
vim.keymap.set("n", "gc", "]c")

-- Git / VCS (using vim-fugitive)
vim.keymap.set("n", "<leader>gc", "<cmd>Git commit<CR>")
vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>")
vim.keymap.set("n", "<leader>gu", "<cmd>Git pull<CR>")

-- Navigation Panels
vim.keymap.set("n", "<leader>ot", "<cmd>terminal<CR>")
vim.keymap.set("n", "<leader>op", "<cmd>NvimTreeToggle<CR>")

