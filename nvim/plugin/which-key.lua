local whichkey=require('which-key')
whichkey.setup()

-- Keymap groups
whichkey.register {
  -- Searching
  ['<leader>t'] = { name = 'Telescope', _ = 'which_key_ignore' },
  ['<leader>ts'] = { name = 'Search', _ = 'which_key_ignore' },
  ['<leader>tss'] = { name = 'String', _ = 'which_key_ignore' },
  ['<leader>tst'] = { name = 'Type of file', _ = 'which_key_ignore' },

  -- Git version control
  ['<leader>g'] = { name = 'Git', _ = 'which_key_ignore' },
  ['<leader>gn'] = { name = 'Neogit', _ = 'which_key_ignore' },
  ['<leader>gd'] = { name = 'Diffview', _ = 'which_key_ignore' },

  -- Other
  ['<leader>gdh'] = { name = 'History', _ = 'which_key_ignore' },
  ['<leader>l'] = { name = 'Lsp', _ = 'which_key_ignore' },
  ['<leader>s'] = { name = 'Search', _ = 'which_key_ignore' },
}

