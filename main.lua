local sprite = require("src.graphics.sprite")
local entity = require("src.logic.entity")
local keyboardMovement = require("src.logic.ai.movement.keyboard_movement")
local bounce = require("src.logic.ai.movement.bounce")
local gamestate = require("src.logic.gamestate")
local followPlayer = require("src.logic.ai.movement.follow_player")
local view = require("src.graphics.view")

local game
local theView

love.load = function()
  local adventurerSprite = sprite.create("assets/images/player.png")
  local player = entity.create(adventurerSprite, 16, 32, 0, 2, keyboardMovement)
  theView = view.create(128, 96, 0, 0)
  game = gamestate.create(player, theView)
end

love.update = function(dt)
  game:update()
end

love.draw = function()
  game:draw()
end

love.keypressed = function(key)
  if key == "escape" then
   love.event.quit()
  end
end
