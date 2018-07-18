local tilesheet = require("src.graphics.tilesheet")
local tilemap = require("src.logic.rooms.tilemap")

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
  self.tilemap:draw(view, self.tilesheet)

  for _, entity in ipairs(self.entities) do
    entity:draw(view)
  end
end

room.create = function(entities)
  local inst = {}

  inst.color = {
    math.random(),math.random(),math.random()
  }

  inst.tilesheet = tilesheet.create("assets/images/tilesheet.png", 8)
  inst.tilemap = tilemap.create()
  inst.roomWidth = inst.tilemap.tileWidth * inst.tilesheet.tileSize
  inst.roomHeight = inst.tilemap.tileHeight * inst.tilesheet.tileSize

  inst.entities = entities

  inst.draw = draw
  inst.update = update

  return inst
end

return room
