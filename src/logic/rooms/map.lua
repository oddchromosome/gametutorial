local room = require("src.logic.rooms.room")
local slime = require("src.mobs.slime")

local map = {}

local draw = function(self, view)
  self.rooms[self.roomIndex]:draw(view)
  love.graphics.printf(
    "Room " .. self.roomIndex,
    500, 20, 100, "center")
end

local currentRoom = function(self)
  return self.rooms[self.roomIndex]
end

local update = function(self, game)
  currentRoom(self):update(game, self)
end

local _createRoom = function()
  local entities = {}

  for i=1,5 do
    local xPos = math.random(128)
    local yPos = math.random(96)
    entities[i] = slime.create(xPos, yPos)
  end

  return room.create(entities)
end

local nextRoom = function(self, game)
  if self.roomIndex == #self.rooms then
    table.insert(self.rooms, _createRoom())
  end

  game.player.x = 1
  self.roomIndex = self.roomIndex + 1
end

local previousRoom = function(self, game)
  if self.roomIndex > 1 then
    self.roomIndex = self.roomIndex - 1
    game.player.x = currentRoom(self).roomWidth
  end
end

map.create = function()
  local inst = {}

  inst.roomIndex = 1
  inst.rooms = {}
  inst.rooms[1] = _createRoom()

  inst.draw = draw
  inst.update = update
  inst.currentRoom = currentRoom
  inst.nextRoom = nextRoom
  inst.previousRoom = previousRoom

  return inst
end

return map
