-- Column to the left side of your text, used for folding, breakpoints, etc
local builtin = require('statuscol.builtin')
require('statuscol').setup {
  relculright = true, -- right align
  segments = {
    -- Folding 
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    -- Diagnostics (breakpoints and stuff)
    { text = { ' %s' }, click = 'v:lua.ScSa' },
    -- Line numbers
    { text = { builtin.lnumfunc, ' ' }, click = "v:lua.ScLa", },
  },
  -- segments = {
  --   { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  --   {
  --     sign = { name = { "Diagnostic" }, maxwidth = 2, auto = true },
  --     click = "v:lua.ScSa"
  --   },
  --   { text = { builtin.lnumfunc }, click = "v:lua.ScLa", },
  --   {
  --     sign = { name = { ".*" }, maxwidth = 2, colwidth = 1, auto = true, wrap = true },
  --     click = "v:lua.ScSa"
  --   },
  -- },
}

  -- segments = {
  --   { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
  --   { text = { '%s' }, click = 'v:lua.ScSa' },
  --   {
  --     text = { builtin.lnumfunc, ' ' },
  --     condition = { true, builtin.not_empty },
  --     click = 'v:lua.ScLa',
  --   },
  -- },
