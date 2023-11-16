  --config = function()
local dap = require 'dap'
local dapui = require 'dapui'
-- Dap UI setup
-- For more information, see |:help nvim-dap-ui|
dapui.setup {
  -- Set icons to characters that are more likely to work in every terminal.
  -- Feel free to remove or use ones that you like more! :)
  -- Don't feel like these are good choices.
  icons = { expanded = '▾', collapsed = '▸', current_frame = '*' },
  controls = {
   icons = {
     pause = '⏸',
     play = '▶',
     step_into = '⏎',
     step_over = '⏭',
     step_out = '⏮',
     step_back = 'b',
     run_last = '▶▶',
     terminate = '⏹',
     disconnect = '⏏',
   },
  },
}

-- Basic debugging keymaps, feel free to change to your liking!
vim.keymap.set('n', '<F5>', dap.continue, { desc = '[debug] Start/Continue' })
vim.keymap.set('n', '<F1>', dap.step_into, { desc = '[debug] Step Into' })
vim.keymap.set('n', '<F2>', dap.step_over, { desc = '[debug] Step Over' })
vim.keymap.set('n', '<F3>', dap.step_out, { desc = '[debug] Step Out' })
vim.keymap.set('n', '<leader>b', dap.toggle_breakpoint, { desc = '[debug] Toggle Breakpoint' })
vim.keymap.set('n', '<leader>B', function()
  dap.set_breakpoint(vim.fn.input 'Breakpoint condition: ')
end, { desc = '[debug] Set Conditional Breakpoint' })

-- Icons
vim.fn.sign_define('DapBreakpoint',{ text ='🟥', texthl ='', linehl ='', numhl =''})
vim.fn.sign_define('DapStopped',{ text ='▶️', texthl ='', linehl ='', numhl =''})

-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
vim.keymap.set('n', '<F7>', dapui.toggle, { desc = '[debug] See last session result.' })

dap.listeners.after.event_initialized['dapui_config'] = dapui.open
dap.listeners.before.event_terminated['dapui_config'] = dapui.close
dap.listeners.before.event_exited['dapui_config'] = dapui.close


-- Install language specifics
-- Python
require('dap-python').setup() -- .setup('~/.virtualenvs/debugpy/bin/python')
--mkdir .virtualenvs
--cd .virtualenvs
--python -m venv debugpy
--debugpy/bin/python -m pip install debugpy

-- Golang
--require('dap-go').setup()
--  end

