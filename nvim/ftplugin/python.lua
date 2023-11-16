local pylsp_cmd = 'pylsp'

-- Check if language-server is available
if vim.fn.executable(pylsp_cmd) ~= 1 then
  return
end

local root_files = {
  'pyproject.toml',
  'setup.py',
  'setup.cfg',
  'requirements.txt',
  'Pipfile',
}

vim.lsp.start {
  name = 'python-language-server',
  cmd = { pylsp_cmd },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
  settings = {
    single_file_support = true,
  },
}

