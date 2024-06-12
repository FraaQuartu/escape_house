function love.load()
  x = 0
  y = 0
end

function love.update(dt)
  if love.keyboard.isDown("right") then
    x = x + 100 * dt
  elseif love.keyboard.isDown("left") then
    x = x - 100 * dt
  elseif love.keyboard.isDown("up") then
    y = y - 100 * dt
  elseif love.keyboard.isDown("down") then
    y = y + 100 * dt
  end
end

function love.draw()
  love.graphics.rectangle("line", x, y, 100, 150)
end