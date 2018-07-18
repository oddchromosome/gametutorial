tilesheet = {}

local drawTile = function(self, view, x, y, row, column)
  view:inContext(function()
    love.graphics.draw(self.image, self.quads[row][column], x, y)
  end)
end

tilesheet.create = function(imagePath, tileSize)
  local inst = {}

  inst.image = love.graphics.newImage(imagePath)
  inst.image:setFilter('nearest', 'nearest')
  inst.tileSize = tileSize

  inst.quads = {}
  -- load quads
  for row=1, inst.image:getHeight() / tileSize do
    inst.quads[row] = {}
    for column=1, inst.image:getWidth() / tileSize do
      inst.quads[row][column] = love.graphics.newQuad(
        (column - 1) * tileSize,
        (row - 1) * tileSize,
        tileSize,
        tileSize,
        inst.image:getDimensions()
      )
    end
  end

  inst.drawTile = drawTile

  return inst
end

return tilesheet
