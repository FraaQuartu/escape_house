local player
local grid

function love.load()
  local unit = 32
  Object = require "classic"
  local Player = require "player"
  player = Player(2*unit, 2*unit, unit)
  local Grid = require "grid"
  grid = Grid(0, 0, unit)
end

function love.update(dt)
  player:update(dt)
  player:resolveGridCollision(grid)
end

function love.draw()
  grid:draw()
  player:draw()
end
