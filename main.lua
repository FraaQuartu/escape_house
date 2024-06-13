function love.load()
  -- Import library
  vector = require("vector")

  -- Player position
  player = {}
  player.pos = vector(0, 0)

  -- Speed limits
  min_v = 5
  max_v = 10

  -- Player velocity and direction
  player.dir = vector(0,0)
  player.v = min_v

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
    player.dir = vector(1,0)
  elseif love.keyboard.isDown("left") then
    player.dir = vector(-1,0)
  elseif love.keyboard.isDown("up") then
    player.dir = vector(0,-1)
  elseif love.keyboard.isDown("down") then
    player.dir = vector(0,1)
  else
    player.dir = vector(0,0)
  end

  player.pos = player.pos + player.v * player.dir * dt
end

function love.draw()
  -- Draw the player
  love.graphics.rectangle("line", math.floor(player.pos.x) * unit, math.floor(player.pos.y) * unit, unit, unit)
end
