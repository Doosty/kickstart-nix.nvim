-- Symbol pairs surrounding [], {}, etc
require('nvim-surround').setup()

-- Indenting visual helper
require("ibl").setup( {
  indent = { char = "┊" },
  scope = { enabled = false },
} )

-- Terminals inside nvim
require("toggleterm").setup()
vim.keymap.set('n', '<leader>tt', '<Cmd>ToggleTerm<CR>')

-- File tree explorer
require("neo-tree").setup( { source_selector = { winbar = false, statusline = false }} )
vim.keymap.set('n', '<leader>ft', '<Cmd>Neotree toggle<CR>')

-- Walk through variables and functions
require("nvim-navbuddy").setup( {lsp = {auto_attach = true,},} )

-- Highlights unique characters for f/F and t/T motions
require('eyeliner').setup( {highlight_on_key = true, dim = true,} )

-- Inline info during debugging
require("nvim-dap-virtual-text").setup()

-- Commenting with hotkeys
require('Comment').setup()

-- Neovim lua configuration
-- require('neodev').setup()

-- Fuzzy Finder (files, lsp, etc)
-- require('telescope').setup()

-- require('barbar').setup()
-- vim.g.barbar_auto_setup = true
require("bufferline").setup{}



