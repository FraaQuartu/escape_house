local player
local unit

function love.load()
  Object = require "classic"
  local Player = require "player"
  player = Player()
  
  unit = 32
end

function love.update(dt)
  player:update(dt)
end

function love.draw()
  player:draw(unit)
end
