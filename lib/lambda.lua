-- Copyright (c) 2010 Marvin Killing
--  
-- Permission is hereby granted, free of charge, to any person
-- obtaining a copy of this software and associated documentation
-- files (the "Software"), to deal in the Software without
-- restriction, including without limitation the rights to use,
-- copy, modify, merge, publish, distribute, sublicense, and/or sell
-- copies of the Software, and to permit persons to whom the
-- Software is furnished to do so, subject to the following
-- conditions:
--  
-- The above copyright notice and this permission notice shall be
-- included in all copies or substantial portions of the Software.
--  
-- THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
-- EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
-- OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
-- NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
-- HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
-- WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
-- FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
-- OTHER DEALINGS IN THE SOFTWARE.

local Lambda = { funcs={} }

function Lambda.split(str, sSeparator, nMax, bRegexp)
  assert(sSeparator ~= '')
  assert(nMax == nil or nMax >= 1)

  local aRecord = {}

  if str:len() > 0 then
    local bPlain = not bRegexp
    nMax = nMax or -1

    local nField=1 nStart=1
    local nFirst,nLast = str:find(sSeparator, nStart, bPlain)
    while nFirst and nMax ~= 0 do
      aRecord[nField] = str:sub(nStart, nFirst-1)
      nField = nField+1
      nStart = nLast+1
      nFirst,nLast = str:find(sSeparator, nStart, bPlain)
      nMax = nMax-1
    end
    aRecord[nField] = str:sub(nStart)
  end

  return aRecord
end

return function(str)
  local head_and_body = Lambda.split(str, "->", 2)
  local head = head_and_body[1]
  local body = head_and_body[2]
  return loadstring("return function"..head.." return "..body.." end")()
end
