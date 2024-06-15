local Grid = Object:extend()
local vector = require("vector")

function Grid:new(x, y, width, height)
  self.pos = vector(x, y)
  self.width = width
  self.height = height
end

function Grid:draw()
  love.graphics.rectangle("line", self.pos.x, self.pos.y, self.width, self.height)
end

return Grid