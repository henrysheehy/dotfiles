-- generating function
local mat = function(args, snip)
    local rows = tonumber(snip.captures[2])
    local cols = tonumber(snip.captures[3])
    local nodes = {}
    local ins_indx = 1 
    for j = 1, rows do 
        table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
        ins_indx = ins_indx + 1 
        for k = 2, cols do 
            table.insert(nodes, t(" & "))
            table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1))) 
            ins_indx = ins_indx + 1 
        end 
        table.insert(nodes, t({ " \\\\", "" }))
    end
    -- fix last node.
    nodes[#nodes] = t(" \\\\")
    return sn(nil, nodes)
end

local rvec = function(args, snip)
    local rows = tonumber(snip.captures[1])
    local cols = 1
    local nodes = {}
    local ins_indx = 1 
    for j = 1, rows do 
        table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
        ins_indx = ins_indx + 1 
        for k = 2, cols do 
            table.insert(nodes, t(" & "))
            table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1))) 
            ins_indx = ins_indx + 1 
        end 
        table.insert(nodes, t({ " \\\\", "" }))
    end
    -- fix last node.
    nodes[#nodes] = t(" \\\\")
    return sn(nil, nodes)
end

local cvec = function(args, snip)
    local cols = tonumber(snip.captures[1])
    local rows = 1
    local nodes = {}
    local ins_indx = 1 
    for j = 1, rows do 
        table.insert(nodes, r(ins_indx, tostring(j) .. "x1", i(1)))
        ins_indx = ins_indx + 1 
        for k = 2, cols do 
            table.insert(nodes, t(" & "))
            table.insert(nodes, r(ins_indx, tostring(j) .. "x" .. tostring(k), i(1))) 
            ins_indx = ins_indx + 1 
        end 
        table.insert(nodes, t({ " \\\\", "" }))
    end
    -- fix last node.
    nodes[#nodes] = t(" \\\\")
    return sn(nil, nodes)
end

-- Environment/syntax context detection 
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end
tex.in_tikz = function()
  local is_inside = vim.fn['vimtex#env#is_inside']("tikzpicture")
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

return
  {
    -- s({ trig = "([bBpvV])mat(%d+)x(%d+)([ar])", regTrig = true, name = "matrix", dscr = "matrix trigger lets go", hidden = true }, --augmented matrix
    s({ trig = "([bBpvV])mat(%d+)x(%d+)", regTrig = true, name = "matrix", dscr = "matrix trigger lets go", hidden = true, snippetType="autosnippet"}, --augmented matrix removed
        fmt([[
        \begin{<>}<>
        <>
        \end{<>}]], 
        {f(function(_, snip)
            return snip.captures[1] .. "matrix" -- captures matrix type
        end),
        f(function(_, snip)
            if snip.captures[4] == "a" then
                out = string.rep("c", tonumber(snip.captures[3]) - 1) -- array for augment 
                return "[" .. out .. "|c]"
            end
            return "" -- otherwise return nothing
        end),
        d(1, mat),
        f(function(_, snip)
            return snip.captures[1] .. "matrix" -- i think i could probably use a repeat node but whatever
        end),},
        { delimiters = "<>" }),
        { condition = tex.in_mathzone, show_condition = tex.in_mathzone }
    ),
    s({ trig = "(%d+)ket", regTrig = true, name = "matrix", dscr = "matrix trigger lets go", hidden = true, snippetType="autosnippet" }, --augmented matrix removed
        fmt([[
        \begin{pmatrix} <> \end{pmatrix}]], 
        {
        d(1, rvec)},
        { delimiters = "<>" }),
        { condition = tex.in_mathzone, show_condition = tex.in_mathzone }
    ),
    s({ trig = "(%d+)bra", regTrig = true, name = "matrix", dscr = "matrix trigger lets go", hidden = true, snippetType="autosnippet" }, --augmented matrix removed
        fmt([[
        \begin{pmatrix} <> \end{pmatrix}]], 
        {
        d(1, cvec)},
        { delimiters = "<>" }),
        { condition = tex.in_mathzone, show_condition = tex.in_mathzone }
    ),
}
