function love.load()
  Object = require "classic"
  require "player"
  player = Player()
  
  unit = 32
end

function love.update(dt)
  player.update(player,dt)
end

function love.draw()
  player.draw(player,unit)
end
