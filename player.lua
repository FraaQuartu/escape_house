local Player = Object:extend()
local vector = require("vector")

function Player:new(x, y, size)
  self.pos = vector(x, y)
  self.dir = vector(0, 0)
  self.min_v = 50
  self.max_v = 100
  self.v = self.min_v
  self.size = size
end

function Player:checkGridCollision(grid)
  if self.pos.x <= grid.pos.x 
    or self.pos.x + self.size >= grid.pos.x + grid.width
    or self.pos.y <= grid.pos.y 
    or self.pos.y + self.size >= grid.pos.y + grid.height
    then
    return true
  else
    return false
  end

end

function Player:update(dt)
  -- You can move faster by pressing space bar
  if love.keyboard.isDown("space") then
    self.v = self.max_v
  else
    self.v = self.min_v
  end

  -- Actual movement, by pressing arrow keys
  if love.keyboard.isDown("right") then
    self.dir = vector(1,0)
  elseif love.keyboard.isDown("left") then
    self.dir = vector(-1,0)
  elseif love.keyboard.isDown("up") then
    self.dir = vector(0,-1)
  elseif love.keyboard.isDown("down") then
    self.dir = vector(0,1)
  else
    self.dir = vector(0,0)
  end

  self.pos = self.pos + self.v * self.dir * dt
end

function Player:draw()
  love.graphics.rectangle("line", math.floor(self.pos.x), math.floor(self.pos.y), self.size, self.size)
end

return Player