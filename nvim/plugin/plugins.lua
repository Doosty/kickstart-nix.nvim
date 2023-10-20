-- Surround | https://github.com/kylechui/nvim-surround
require('nvim-surround').setup()

-- Indent-blankline | https://github.com/lukas-reineke/indent-blankline.nvim#simple
require("ibl").setup({ scope = { enabled = false }, })

-- Toggleterm | https://github.com/akinsho/toggleterm.nvim
require("toggleterm").setup()
vim.keymap.set('n', '<leader>tt', '<Cmd>ToggleTerm<CR>')

-- Barbar | https://github.com/romgrk/barbar.nvim
--require('barbar').setup()
--vim.g.barbar_auto_setup = true

-- Neo-tree | https://github.com/nvim-neo-tree/neo-tree.nvim
require("neo-tree").setup({ source_selector = { winbar = false, statusline = false } })
vim.keymap.set('n', '<leader>ft', '<Cmd>Neotree toggle<CR>')

-- Navbuddy | https://github.com/SmiteshP/nvim-navbuddy
require("nvim-navbuddy").setup({lsp = {auto_attach = true,},})

-- Eyeliner | https://github.com/jinh0/eyeliner.nvim
-- Highlights unique characters for f/F and t/T motions
require('eyeliner').setup({ highlight_on_key = true, dim = true, })

-- Navbuddy | https://github.com/SmiteshP/nvim-navbuddy
require("nvim-dap-virtual-text").setup()

-- Commenting | https://github.com/numToStr/Comment.nvim
require('Comment').setup()


