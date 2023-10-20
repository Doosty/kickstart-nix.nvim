vim.keymap.set('n', '<leader>gdhb', function()
  vim.cmd.DiffviewFileHistory(vim.api.nvim_buf_get_name(0))
end, { desc = '[diffview] files history (current buffer)' })

vim.keymap.set('n', '<leader>gdhd', vim.cmd.DiffviewFileHistory, { desc = '[diffview] files history (cwd)' })

vim.keymap.set('n', '<leader>gdo', vim.cmd.DiffviewOpen, { desc = '[diffview] open' })

vim.keymap.set('n', '<leader>gdc', vim.cmd.DiffviewClose, { desc = '[diffview] close' })

vim.keymap.set('n', '<leader>gdf', vim.cmd.DiffviewToggleFiles, { desc = '[diffview] files toggle' })
