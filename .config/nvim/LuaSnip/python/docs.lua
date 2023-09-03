local helpers = require('personal.luasnip-helper-funcs')
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

local tex = {}
local function in_env(name)
  local is_inside = vim.fn['vimtex#env#is_inside'](name)
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

tex.in_pythontex = function() return in_env("pycode") or in_env("pyconsole") end

local make_condition = require("luasnip.extras.conditions").make_condition

-- local is_python_cond = make_condition(is_python)
-- local is_tex_cond = make_condition(is_tex)
local in_python_cond = make_condition(tex.in_pythontex)

return
{
  -- FUNCTION PARAMETERS for use in docstrings, with heading
  s({trig="PP", snippetType="autosnippet"},
    fmta(
      [[
      Parameters
      ----------
      <> : <>
          <>
      ]],
      {
        i(1, "name"),
        i(2, "data_type"),
        d(3, get_visual),
      }
    ),
    {condition = line_begin and in_python_cond, show_condition = line_begin and in_python_cond}
  ),
  -- FUNCTION RETURNS for use in docstrings, with heading
  s({trig="RR", snippetType="autosnippet"},
    fmta(
      [[
      Returns
      ----------
      <> : <>
          <>
      ]],
      {
        i(1, "name"),
        i(2, "data_type"),
        d(3, get_visual),
      }
    ),
    {condition = line_begin and in_python_cond, show_condition = line_begin and in_python_cond}
  ),
  -- FUNCTION PARAMETER for use in docstrings
  s({trig="::", snippetType="autosnippet"},
    fmta(
      [[
      <> : <>
          <>
      ]],
      {
        i(1, "name"),
        i(2, "data_type"),
        d(3, get_visual),
      }
    ),
    {condition = line_begin and in_python_cond, show_condition = line_begin and in_python_cond}
  ),
  -- LONG STRING OF DASHES FOR COMMENTS
  s({trig = "--", snippetType="autosnippet"},
    {t('# -------------------------------------------------------------------- #')},
    {condition = line_begin and in_python_cond, show_condition = line_begin and in_python_cond}
  ),
  -- MULTILINE COMMENT
  s({trig = "cc", snippetType="autosnippet"},
    fmta(
      [[
      """
      <>
      """
      ]],
      {
        d(1, get_visual),
      }
    ),
    {condition = line_begin and in_python_cond, show_condition = line_begin and in_python_cond}
  ),
}
