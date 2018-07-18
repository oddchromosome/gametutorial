local view = {}

local scale = function(self)
  return {
    x = love.graphics.getWidth() / self.gameWidth,
    y = love.graphics.getHeight() / self.gameHeight
  }
end

local clamp = function(min, n, max)
  if n < min then
    return min
  end
  if n > max then
    return max
  end
  return n
end

local viewOffset = 4

local update = function(self, game)
  local currentRoom = game.map:currentRoom()
  local maxX = (currentRoom.roomWidth - self.gameWidth) + viewOffset
  -- WHY +10 ?!
  local maxY = (currentRoom.roomHeight - self.gameHeight) + viewOffset
  self.x = clamp(-viewOffset, game.player.x - self.gameWidth / 2, maxX)
  self.y = clamp(-viewOffset, game.player.y - self.gameHeight / 2, maxY)
end

local inContext = function(self, drawFunction)
  local scale = scale(self)
  love.graphics.push('all')
  love.graphics.scale(scale.x,scale.y)
  love.graphics.translate(-self.x, -self.y)
  drawFunction()
  love.graphics.pop()
end

view.create = function(gameWidth, gameHeight, x, y)
  local inst = {}

  inst.gameWidth = gameWidth
  inst.gameHeight = gameHeight
  inst.x = x
  inst.y = y

  inst.update = update
  inst.inContext = inContext

  return inst
end

return view
