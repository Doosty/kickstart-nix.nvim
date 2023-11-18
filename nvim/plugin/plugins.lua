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


-- # Select between python virtual environments during runtime
require("venv-selector").setup({
    -- Your options go here
    -- name = "venv",
    -- auto_refresh = false
    dap_enabled = true
})
vim.keymap.set('n', '<leader>vs', "<cmd>VenvSelect<cr>", { desc = 'Open VenvSelector' })
vim.keymap.set('n', '<leader>vc', "<cmd>VenvSelectCached<cr>", { desc = 'Retrieve the venv from a cache' })


-- Py lsp configuration
require'py_lsp'.setup {
  language_server = "pylsp",
  -- source_strategies = {"system"},
  -- This is optional, but allows to create virtual envs from nvim
  -- host_python = "/nix/store/ffll6glz3gwx342z0ch8wx30p5cnqz1z-python3-3.11.5/lib/python3.11/venv/bin/python",
  -- default_venv_name = ".venv" -- For local venv
}
