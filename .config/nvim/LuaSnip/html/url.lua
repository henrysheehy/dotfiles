local line_begin = require("luasnip.extras.expand_conditions").line_begin

return
{
    -- HYPERLINK URL
    s({trig="url", snippetType="autosnippet"},
      fmt(
        [[
          <html>
          <head>
            <meta http-equiv="refresh" content="0; url={}">
          </head>
          </html>
        ]],
        {
          i(1)
        }
      ),
      {condition = line_begin}
    ),
}
