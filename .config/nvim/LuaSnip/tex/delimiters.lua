-- Math context detection 
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

local function char_count_same(c1, c2)
	local line = vim.api.nvim_get_current_line()
	-- '%'-escape chars to force explicit match (gsub accepts patterns).
	-- second return value is number of substitutions.
	local _, ct1 = string.gsub(line, '%'..c1, '')
	local _, ct2 = string.gsub(line, '%'..c2, '')
	return ct1 == ct2
end

local function even_count(c)
	local line = vim.api.nvim_get_current_line()
	local _, ct = string.gsub(line, c, '')
	return ct % 2 == 0
end

local function neg(fn, ...)
	return not fn(...)
end

local function part(fn, ...)
	local args = {...}
	return function() return fn(unpack(args)) end
end

-- This makes creation of pair-type snippets easier.
local function pair(pair_begin, pair_end, expand_func, ...)
	-- triggerd by opening part of pair, wordTrig=false to trigger anywhere.
	-- ... is used to pass any args following the expand_func to it.
	return s({trig = pair_begin, wordTrig=false, snippetType="autosnippet"},{
			t({pair_begin}), i(1), t({pair_end})
		}, {
			condition = part(expand_func, part(..., pair_begin, pair_end))
		})
end

return
{
pair("`", "'", neg, even_count),
pair("``", "''", neg, even_count),
pair('\\left(', '\\right)', neg, even_count),
pair('\\left[', '\\right]', neg, even_count),
pair('$', '$', neg, even_count),
}

