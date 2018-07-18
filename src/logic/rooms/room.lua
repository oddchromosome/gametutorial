local room = {}

local update = function(self, game, map)
  for _, entity in ipairs(self.entities) do
    entity:update(game)
  end

  if game.player.x > self.roomWidth then
    map:nextRoom(game)
  end

  if game.player.x < 0 then
    map:previousRoom(game)
  end
end

local draw = function(self, view)
  view:inContext(function()
    love.graphics.setColor(unpack(self.color))
    love.graphics.rectangle("fill",0,0,self.roomWidth,self.roomHeight)
  end)

  for _, entity in ipairs(self.entities) do
    entity:draw(view)
  end
end

room.create = function(entities)
  local inst = {}

  inst.roomWidth = 256
  inst.roomHeight = 96
  inst.color = {
    math.random(),math.random(),math.random()
  }
  inst.entities = entities

  inst.draw = draw
  inst.update = update

  return inst
end

return room
