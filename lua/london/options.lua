-- see :help vim.opt & :help option-list

local opt = vim.opt

-- line numbers, etc
opt.nu = true
opt.relativenumber = true
opt.cursorline = true
opt.scrolloff = 10
opt.breakindent = true
opt.signcolumn = 'yes'
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }
opt.termguicolors = true

opt.updatetime = 250
opt.timeoutlen = 300

opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.smoothscroll = true

opt.ignorecase = true
opt.smartcase = true

opt.splitbelow = true
opt.splitright = true

opt.inccommand = 'split'

opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

opt.smartindent = true
opt.wrap = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
opt.undofile = true

opt.confirm = true

opt.smartcase = true
opt.ignorecase = true
