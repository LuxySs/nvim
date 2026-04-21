local luasnip = require('luasnip')
require('luasnip.loaders.from_vscode').lazy_load()
luasnip.config.setup({})

local ls = require('luasnip')
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node
local extras = require('luasnip.extras')
local rep = extras.rep
local fmta = require('luasnip.extras.fmt').fmta
local c = ls.choice_node
local f = ls.function_node
local d = ls.dynamic_node
local sn = ls.snippet_node

ls.add_snippets('tex', {
  s('\\beg', {
    t('\\begin{'),
    i(1),
    t('}'),
    t({ '', '\t' }),
    i(0),
    t({ '', '\\end{' }),
    rep(1),
    t('}'),
  }),
})
