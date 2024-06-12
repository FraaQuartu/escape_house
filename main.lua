function love.load()
  -- Player position
  x = 0
  y = 0

  -- Player velocity
  min_v = 5
  max_v = 10
  v = min_v

  -- Size of the tilemap
  unit = 32
end

function love.update(dt)
  -- You can move faster by pressing space bar
  if love.keyboard.isDown("space") then
    v = max_v
  else
    v = min_v
  end

  -- Actual movement, by pressing arrow keys
  if love.keyboard.isDown("right") then
    x = x + v * dt
  elseif love.keyboard.isDown("left") then
    x = x - v * dt
  elseif love.keyboard.isDown("up") then
    y = y - v * dt
  elseif love.keyboard.isDown("down") then
    y = y + v * dt
  end
end

function love.draw()
  -- Draw the player
  love.graphics.rectangle("line", math.floor(x) * unit, math.floor(y) * unit, unit, unit)
end
