-- london.nvim init.lua. all configuration is done via lua directory.

-- set <space> as leader key
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- nerd font
vim.g.have_nerd_font = true

require 'london.options'
require 'london.keymap'
require 'london.lazy-bootstrap'
