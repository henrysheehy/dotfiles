local helpers = require('personal.luasnip-helper-funcs')
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Return snippet tables
return
  {
    -- TODO NOTE
    s({trig="TODOO", snippetType="autosnippet"},
      {
        t("**TODO:** "),
      }
    ),
    -- LINK; CAPTURE TEXT IN VISUAL
    s({trig="LL", wordTrig=true, snippetType="autosnippet"},
      fmta(
        [[[<>](<>)]],
        {
          d(1, get_visual),
          i(2),
        }
      )
    ),
    -- LINK; CAPTURE URL IN VISUAL
    s({trig="LU", wordTrig=true, snippetType="autosnippet"},
      fmta(
        [[[<>](<>)]],
        {
          i(1),
          d(2, get_visual),
        }
      )
    ),
    -- LINK; CAPTURE URL IN VISUAL
    s({trig="IIM", wordTrig=true, snippetType="autosnippet"},
      fmt(
        [[![{}]({} "{}")]],
        {
          i(1),
          d(2, get_visual),
          rep(1)
        }
      )
    ),
    -- STRIKETHROUGH
    s({trig="tst", snippetType="autosnippet"},
      fmta(
        [[~~<>~~]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- BOLDFACE TEXT
    s({trig="tbf", snippetType="autosnippet"},
      fmta(
        [[**<>**]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- ITALIC TEXT
    s({trig="tii", snippetType="autosnippet"},
      fmta(
        [[*<>*]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- underlined text
    s({trig="uu", snippetType="autosnippet"},
      fmt(
        [[<u>{}/<u>]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- keys
    s({trig="tke", snippetType="autosnippet"},
      fmt(
        [[<kbd>{}</kbd>]],
        {
          d(1, get_visual),
        }
      )
    ),
    -- YouTube embedded; capture URL in visual
    s({trig="tyt", wordTrig=true, snippetType="autosnippet"},
      fmta(
        [[[![Watch the video](https://img.youtube.com/vi/<>/default.jpg)](https://youtu.be/<>)]],
        {
          d(1, get_visual),
          rep(1)
        }
      )
    ),
  }

