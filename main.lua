function love.load()
  require 'board'
  createBoard()
  love.graphics.setBackgroundColor(255, 255, 255)
end

function love.update(dt)
  board:update()
end

function love.draw()
  -- love.graphics.setColor(255, 0, 0)
  -- love.graphics.print(rawget(board, ), 0, 0)
  -- love.graphics.rectangle("fill", 0, 0, 200, 200)
  board:draw()
end