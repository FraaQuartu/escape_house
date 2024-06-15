local Grid = Object:extend()

function Grid:new(x, y, width, height)
  self.x = x
  self.y = y
  self.width = width
  self.height = height
end

function Grid:draw()
  love.graphics.rectangle("line", self.x, self.y, self.width, self.height)
end

return Grid