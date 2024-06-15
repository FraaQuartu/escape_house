local Player = Object:extend()
local vector = require("vector")

function Player:new(x, y, unit)
  self.pos = vector(x, y)
  self.last_pos = self.pos
  self.dir = vector(0, 0)
  self.min_v = 50
  self.max_v = 100
  self.v = self.min_v
  self.unit = unit
end

function Player:checkGridCollision(grid)
  self.pos_unit = (self.pos - grid.pos) / self.unit
  self.pos_unit.x = math.floor(self.pos_unit.x)
  self.pos_unit.y = math.floor(self.pos_unit.y)
  
  local tile = grid.tilemap[self.pos_unit.y + 1][self.pos_unit.x + 1]
  return tile == 1
end

function Player:resolveGridCollision(grid)
  if self:checkGridCollision(grid) then
    self.pos = self.last_pos
  end
end

function Player:update(dt)
  -- You can move faster by pressing space bar
  if love.keyboard.isDown("space") then
    self.v = self.max_v
  else
    self.v = self.min_v
  end

  self.last_pos = self.pos

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
  love.graphics.rectangle("line", math.floor(self.pos.x / self.unit) * self.unit , math.floor(self.pos.y / self.unit) * self.unit, self.unit, self.unit)
end

return Player