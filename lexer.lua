local program = [[135]] --This is the program for now. Shush.

local tokens = {}
local function lex(code)
  local check = 1
  local endPoint = 1
  local currentToken = ""
  while #code >= endPoint do
    local dataTypa
    local charac = string.sub(code, endPoint, endPoint)
    if charac == " " then
      if type(tonumber(currentToken)) == "number" then
        currentToken = currentToken.."n"
        dataTypa = "number"
      else
        dataTypa = "id"
      end
      table.insert(tokens, {dataTypa,currentToken})
      currentToken = ""
    else
      currentToken = currentToken..charac
    end
    endPoint = endPoint + 1
  end
  if type(tonumber(currentToken)) == "number" then
    currentToken = currentToken.."n"
    dataTypa = "number"
  else
    dataTypa = "id"
  end
  table.insert(tokens, {dataTypa,currentToken})
  while check < #code do
    for i, v in pairs(tokens) do
      if v[2] == " " then
       table.remove(tokens, i)
      end
    end
    check = check + 1
  end
end

lex(program)

for i, v in pairs(tokens) do
  print(tostring(i)..": "..v[1])
end
