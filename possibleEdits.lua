--This is the lexer for string detector 1
local program = [[135 " Minecraft"]] --This is the program for now. Shush.

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
    if charac == "\"" then
        if type(tonumber(currentToken)) == "number" then
            currentToken = currentToken.."n"
            dataTypa = "number"
        else
            dataTypa = "id"
        end
        table.insert(tokens, {dataTypa,currentToken})
        charac = ""
        currentToken = ""
        local something = endPoint
        while charac ~= "\"" and endPoint == something do
            charac = string.sub(code, endPoint, endPoint)
            print(charac)
            currentToken = currentToken..charac
            print(currentToken)
            table.insert(tokens, {"string", currentToken})

            endPoint = endPoint + 1
        end
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
      if v[2] == " " or v[2] == "\"" and v[1] == "id" then
       table.remove(tokens, i)
      end
    end
    check = check + 1
  end
end

lex(program)

for i, v in pairs(tokens) do
  print(tostring(i)..": "..v[2].." is classified as a "..v[1])
end

