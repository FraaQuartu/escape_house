local Grid = Object:extend()
local vector = require("vector")

function Grid:new(x, y, unit)
  self.tilemap = {
    {1, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 1, 1, 0, 1},
    {1, 0, 0, 0, 1, 1, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 1},
  }
  self.pos = vector(x, y)
  self.unit = unit
  self.width = #self.tilemap[1] * unit
  self.height = #self.tilemap * unit
end

function Grid:draw()
  -- love.graphics.rectangle("line", self.pos.x, self.pos.y, self.width, self.height)
  for i,row in ipairs(self.tilemap) do
    for j,tile in ipairs(row) do
      --First check if the tile is not zero
      if tile ~= 0 then

        --Set the color based on the tile number
        if tile == 1 then
          --setColor uses RGB, A is optional
          --Red, Green, Blue, Alpha
          love.graphics.setColor(1, 1, 1)
        elseif tile == 2 then
          love.graphics.setColor(1, 0, 0)
        elseif tile == 3 then
          love.graphics.setColor(1, 0, 1)
        elseif tile == 4 then
          love.graphics.setColor(0, 0, 1)
        elseif tile == 5 then
          love.graphics.setColor(0, 1, 1)
        end

        --Draw the tile
        love.graphics.rectangle("fill", self.pos.x + (j-1) * self.unit, self.pos.y + (i-1) * self.unit, self.unit, self.unit)
      end 
    end
  end
end

return Grid