local v = require("src.math.vector")

local followPlayer = {}

followPlayer.update = function(entity, game)
  local playerPos = game.player:toPosition()
  local entityPos = entity:toPosition()

  local distance = v.distance(entityPos, playerPos)

  if distance > 10 then
    local unitVector = v.normalise(entityPos, playerPos)
    entity.x = entity.x + unitVector.dx * entity.speed
    entity.y = entity.y + unitVector.dy * entity.speed
  end
end

return followPlayer
