-- keymaps

local map = vim.keymap.set
local opts = { noremap = true, silent = true }

map("n", "<leader>e", vim.cmd.Ex, opts)
map('i', 'jj', '<esc>', opts)
map('n', 'U', '<C-r>', {})

-- highlight on search
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- highlight when yanking text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- use Ctrl+hjkl to switch between windows
map('n', '<C-h>', '<C-w><C-h>') 
map('n', '<C-l>', '<C-w><C-l>')
map('n', '<C-j>', '<C-w><C-j>')
map('n', '<C-k>', '<C-w><C-k>')

-- move highlighted line up or down
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- replace selected text in visual mode with what was last yanked
map("x", "<leader>p", [["_dP]])

-- delete to a blank register
vim.keymap.set({"n", "v"}, "<leader>d", '"_d')


