function love.load()
  -- Player position
  player = {}
  player.x = 0
  player.y = 0

  -- Player velocity
  player.v = min_v

  -- Speed limits
  min_v = 5
  max_v = 10

  -- Size of the tilemap
  unit = 32
end

function love.update(dt)
  -- You can move faster by pressing space bar
  if love.keyboard.isDown("space") then
    player.v = max_v
  else
    player.v = min_v
  end

  -- Actual movement, by pressing arrow keys
  if love.keyboard.isDown("right") then
    player.x = player.x + player.v * dt
  elseif love.keyboard.isDown("left") then
    player.x = player.x - player.v * dt
  elseif love.keyboard.isDown("up") then
    player.y = player.y - player.v * dt
  elseif love.keyboard.isDown("down") then
    player.y = player.y + player.v * dt
  end
end

function love.draw()
  -- Draw the player
  love.graphics.rectangle("line", math.floor(player.x) * unit, math.floor(player.y) * unit, unit, unit)
end
