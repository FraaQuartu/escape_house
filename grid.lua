local Grid = Object:extend()
local vector = require("vector")
local img
local quads

function Grid:new(x, y, unit)
  img = love.graphics.newImage("tileset.png")

  width = 16
  height = 16
  image_width = img:getWidth()
  image_height = img:getHeight()
  print(image_height)
  print(image_width)
  quads = {}

  for i=0,5 do
    for j=0,16 do
      --The only reason this code is split up in multiple lines
      --is so that it fits the page
      table.insert(quads,
        love.graphics.newQuad(
          j * (width),
          i * (height),
          width, height,
          image_width, image_height))
    end
  end

  self.tilemap = {
    {83, 7, 7, 7, 7, 7, 7, 7, 7, 7, 84},
    {42, 19, 19, 19, 19, 19, 19, 19, 19, 19, 42},
    {42, 19, 19, 19, 19, 19, 19, 19, 19, 19, 42},
    {42, 19, 19, 19, 19, 19, 19, 19, 19, 19, 42},
    {42, 19, 19, 19, 19, 19, 19, 19, 19, 19, 42},
    {42, 19, 19, 19, 19, 19, 19, 19, 19, 19, 42},
    {42, 19, 19, 19, 19, 19, 19, 19, 19, 19, 42},
    {42, 19, 19, 19, 19, 19, 19, 19, 19, 19, 42},
    {42, 19, 19, 19, 19, 19, 19, 19, 19, 19, 42},
    {42, 19, 19, 19, 19, 19, 19, 19, 19, 19, 42},
    {42, 19, 19, 19, 19, 19, 19, 19, 19, 19, 42},
    {85, 7, 7, 7, 7, 7, 7, 7, 7, 7, 86},
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
        --Draw the image with the correct quad
        love.graphics.draw(img, quads[tile], self.pos.x + (j-1) * self.unit, self.pos.y + (i-1) * self.unit, 0, 2, 2)
      end 
    end
  end
end

return Grid