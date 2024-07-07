print("hello")
local my_variable = "Custom Text"

-- Using concatenation
local header = [[
First line of text.
]] .. my_variable .. [[
Third line of text.
]]
print( header)
-- Using string.format
local header_formatted = string.format([[
First line of text.
%s
Third line of text.
]], my_variable)

-- Use it in mini.starter setup

