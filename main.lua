local player
local grid

function love.load()
  Object = require "classic"
  local Player = require "player"
  player = Player(10, 10, 32)
  local Grid = require "grid"
  grid = Grid(0, 0, 200, 300)
end

function love.update(dt)
  player:update(dt)
end

function love.draw()
  if not player:checkGridCollision(grid) then
    player:draw()
  end
  grid:draw()
end
