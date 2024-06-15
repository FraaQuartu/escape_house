function love.load()
  Object = require "classic"
  require "player"
  player = Player()
  
  unit = 32
end

function love.update(dt)
  player:update(dt)
end

function love.draw()
  player:draw(unit)
end
