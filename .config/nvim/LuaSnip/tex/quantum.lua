local get_visual = function(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
end

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Environment/syntax context detection 
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end
tex.in_tikz = function()
  local is_inside = vim.fn['vimtex#env#is_inside']("tikzpicture")
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

-- Return snippet tables
return
  {
    -- s({trig="Mean-f", snippetType="autosnippet"},
    --   {
    --     t("Mean-field"),
    --   },
    --   {condition = tex.in_text}
    -- ),
    -- s({trig="mean-f", snippetType="autosnippet"},
    --   {
    --     t("mean-field"),
    --   },
    --   {condition = tex.in_text}
    -- ),
    -- s({trig="Free e", snippetType="autosnippet"},
    --   {
    --     t("Free energy"),
    --   },
    --   {condition = tex.in_text}
    -- ),
    -- s({trig="free e", snippetType="autosnippet"},
    --   {
    --     t("free energy"),
    --   },
    --   {condition = tex.in_text}
    -- ),
    -- s({trig="ham", snippetType="autosnippet"},
    --   {
    --     t("hamiltonian"),
    --   },
    --   {condition = tex.in_text}
    -- ),
    s({trig="\\ham"},
      {
        t("\\hat{\\mathcal{H}}"),
      },
      {condition = tex.in_mathzone}
    ),
    s({trig=";ft", snippetType="autosnippet"},
      {
        t("\\hat{c}_{k} = \\sum_i e^{iajk} \\hat{c}_{j}"),
      },
      {condition = tex.in_mathzone}
    ),
    s({trig="cc", dscr="cc"},
      fmta(
        "\\hat{c}^{<>}_{<>}\\hat{c}^{<>}_{<>}<>",
        {
          i(1),
          i(2),
          i(3),
          i(4),
          i(0),
        }
        ),
        {condition = tex.in_mathzone}
    ),
    s({trig="c", dscr="annihilation operator"},
      fmta(
        "\\hat{c}^{<>}_{<>}<>",
        {
          i(1),
          i(2),
          i(0),
        }
        ),
        {condition = tex.in_mathzone}
    ),
    s({trig="cd", dscr="creation operator"},
      fmta(
        "\\hat{c}^{<>\\dagger}_{<>}<>",
        {
          i(1),
          i(2),
          i(0),
        }
        ),
        {condition = tex.in_mathzone}
    ),
    s({trig="cdc", dscr="c^dagger c"},
      fmta(
        "\\hat{c}^{<>\\dagger}_{<>}\\hat{c}^{<>}_{<>}<>",
        {
          i(1),
          i(2),
          i(3),
          i(4),
          i(0),
        }
        ),
        {condition = tex.in_mathzone}
    ),
    s({trig="uint", dscr="Interaction"},
      fmta(
        "\\hat{c}^{<>\\dagger}_{<>}\\hat{c}^{<>\\dagger}_{<>} \\hat{c}^{<>}_{<>}\\hat{c}^{<>}_{<>}<>",
        {
          i(1),
          i(2),
          i(3),
          i(4),
          rep(3),
          rep(4),
          rep(1),
          rep(2),
          i(0),
        }
        ),
        {condition = tex.in_mathzone}
    ),
    s({trig=";n", dscr="Number operator"},
      fmta(
        "\\hat{c}^{<>\\dagger}_{<>}\\hat{c}^{<>}_{<>}<>",
        {
          i(1),
          i(2),
          rep(1),
          rep(2),
          i(0),
        }
        ),
        {condition = tex.in_mathzone}
    ),
    s({trig="\\d", dscr="complement"},
        t("\\dagger"),
        {condition = tex.in_mathzone}
    ),
  -- Bra
  s({trig = "([^%a])<|", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\bra{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- Ket
  s({trig = "([^%a])|>", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\ket{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- Braket
  s({trig = "([^%a])<|>", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\braket{<>}{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
        i(2),
      }
    ),
    {condition = tex.in_mathzone}
  ),
  -- Expectation value
  s({trig = "([^%a])<>", wordTrig = false, regTrig = true, snippetType="autosnippet"},
    fmta(
      "<>\\braket{<>}",
      {
        f( function(_, snip) return snip.captures[1] end ),
        d(1, get_visual),
      }
    ),
    {condition = tex.in_mathzone}
  ),
}
