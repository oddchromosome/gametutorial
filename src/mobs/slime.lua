local sprite = require("src.graphics.sprite")
local entity = require("src.logic.entity")
local followPlayer = require("src.logic.ai.movement.follow_player")

local slime = {}
local speed = 1

local slimeSprite = sprite.create("assets/images/slime.png")

slime.create = function(xPos, yPos)
  return entity.create(slimeSprite, xPos, yPos, 0, speed, followPlayer)
end

return slime
