local player

function love.load()
  Object = require "classic"
  local Player = require "player"
  player = Player(32)
end

function love.update(dt)
  player:update(dt)
end

function love.draw()
  player:draw()
end
