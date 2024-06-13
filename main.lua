function love.load()
  -- Player position
  player = {}
  player.x = 0
  player.y = 0

  -- Player velocity
  player.dir = {}
  player.dir.x = 0
  player.dir.y = 0
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
    player.dir.x = 1
    player.dir.y = 0
    -- player.x = player.x + player.v * dt
  elseif love.keyboard.isDown("left") then
    player.dir.x = -1
    player.dir.y = 0
    -- player.x = player.x - player.v * dt
  elseif love.keyboard.isDown("up") then
    player.dir.x = 0
    player.dir.y = -1
    -- player.y = player.y - player.v * dt
  elseif love.keyboard.isDown("down") then
    player.dir.x = 0
    player.dir.y = 1
    -- player.y = player.y + player.v * dt
  else
    player.dir.x = 0
    player.dir.y = 0
  end

  player.x = player.x + player.v * player.dir.x * dt
  player.y = player.y + player.v * player.dir.y * dt
end

function love.draw()
  -- Draw the player
  love.graphics.rectangle("line", math.floor(player.x) * unit, math.floor(player.y) * unit, unit, unit)
end
