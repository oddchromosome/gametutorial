local tilemap = {}

local draw = function(self, view, tilesheet)
  for i=1,#self.map do
    local char = self.map:sub(i,i)
    local x,y =
    ((i-1) % self.tileWidth) * tilesheet.tileSize,
    math.floor((i-1) / self.tileWidth) * tilesheet.tileSize

    if char == "x" then tilesheet:drawTile(view, x, y, 2, 3) end
    if char == "^" then tilesheet:drawTile(view, x, y, 3, 1) end
    if char == "=" then tilesheet:drawTile(view, x, y, 2, 1) end
    if char == "." then tilesheet:drawTile(view, x, y, 1, 1) end
    if char == "*" then tilesheet:drawTile(view, x, y, 1, 2) end
    if char == "s" then tilesheet:drawTile(view, x, y, 2, 4) end
    if char == "X" then tilesheet:drawTile(view, x, y, 3, 3) end

  end
end

tilemap.create = function()
  local inst = {}

  inst.tileWidth = 24
  inst.tileHeight = 18

  local map = [[
  ^^^^^^^^^^^^^XXX^^^^^^^^
  xxxxxxxxxxxxxXXXxxxxxxxx
  xxxxxxxxxxxxxXXXxxxxxxxx
  =============XXXxxxxxxxx
  .............sXXxxxxxxxx
  ......*.......sXxxxxxxxx
  ...............s========
  ..........*.............
  ........................
  ........................
  ........................
  ........*........*......
  ........................
  ........................
  ...*.........*..........
  ........................
  .......*...........*....
  ........................
  ]]
  inst.map = map:gsub("%s", "")

  inst.draw = draw

  return inst
end

return tilemap
