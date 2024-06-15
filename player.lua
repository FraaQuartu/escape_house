Player = Object:extend()

function Player:new()
  vector = require("vector")
  self.pos = vector(0,0)
  self.dir = vector(0,0)
  self.min_v = 5
  self.max_v = 10
  self.v = 5
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

function Player:draw(unit)
  love.graphics.rectangle("line", math.floor(self.pos.x) * unit, math.floor(self.pos.y) * unit, unit, unit)
end