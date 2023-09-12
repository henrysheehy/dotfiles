local M = {}

local ls = require("luasnip")
local sn = ls.snippet_node
local i = ls.insert_node

function M.get_ISO_8601_date()
  return os.date("%Y-%m-%d")
end

function M.get_ISO_8601_time()
  return os.date("%H:%M:%S%z")
end

function M.get_ISO_8601_date_time()
  return os.date("%Y-%m-%d %H:%M:%S%z")
end

function M.get_journal_date_time()
  return os.date( "!%a %b %d, %H:%M:%S%z")
end

function M.get_visual(args, parent)
  if (#parent.snippet.env.SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
end

-- Begin:
-- Pythontex and Minted
-- Developed from https://evesdropper.dev/files/luasnip/conditions-minted/
ls.filetype_extend("tex", { "python" })

-- local function is_tex()
--     return vim.bo.filetype == "tex"
-- end

-- local function is_python()
--     return vim.bo.filetype == "python"
-- end 

-- -- tex in python 
-- local function env(name) 
--     local is_inside = vim.fn['vimtex#env#is_inside'](name)
--     return (is_inside[1] > 0 and is_inside[2] > 0)
-- end

-- local function in_pythontex() 
--     return env("pycode")
-- end

-- local function in_mintedPython()
--     return vim.fn['vimtex#syntax#in']("texMintedZonePython") == 1
-- end

-- local make_condition = require("luasnip.extras.conditions").make_condition

-- local is_python_cond = make_condition(is_python)
-- local is_tex_cond = make_condition(is_tex)
-- local in_pythontex_cond = make_condition(is_python)
-- local in_mintedpy_cond = make_condition(in_mintedPython) -- for other languages, replace Python with the language name

-- local function in_python()
--   return (is_python_cond or (is_tex_cond and (in_mintedpy_cond or in_pythontex_cond) ) )
-- end

-- End

return M
