local omnisharp_cmd = 'omnisharp'

if vim.fn.executable(omnisharp_cmd) ~= 1 then
  return
end

local root_files = {
  '.sln',
  '.csproj',
  'omnisharp.json',
  'function.json',
}

vim.lsp.start {
  name = 'omnisharp',
  cmd = { omnisharp_cmd },
  root_dir = vim.fs.dirname(vim.fs.find(root_files, { upward = true })[1]),
  capabilities = require('user.lsp').make_client_capabilities(),
}
