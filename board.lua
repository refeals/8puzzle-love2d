board = {}
PieceSize = 200

function CreateBoard()
  require "piece"

  board.x = 0
  board.y = 0

  board.pieces = {}
  for i=1, 9 do
    local offsetX = (i - 1) % 3
    local offsetY = math.floor((i - 1) / 3)
    local ps = CreatePiece(i, board.x + PieceSize * offsetX, board.y + PieceSize * offsetY)
    table.insert(board.pieces, ps)
  end

  board.emptyIndex = 9
end

function board:update(dt)
  function love.keypressed(key)
    if key == "up" then
      board:moveDown()
    end
    if key == "down" then
      board:moveUp()
    end
    if key == "left" then
      board:moveRight()
    end
    if key == "right" then
      board:moveLeft()
    end
  end
end

function board:draw(dt)
  for i, p in pairs(board["pieces"]) do
    p:draw(dt)
  end
end

function board:move(p1, p2)
  local x, y = board.pieces[p1].x, board.pieces[p1].y
  board.pieces[p1].x, board.pieces[p1].y = board.pieces[p2].x, board.pieces[p2].y
  board.pieces[p2].x, board.pieces[p2].y = x, y
end

function board:moveDown()
  local p1 = board.pieces[board.emptyIndex]
  local p2Index

  if p1.y ~= 400 then
    p2Index = board:getIndexFromPosition(p1.x, p1.y + PieceSize)

    if p2Index ~= -1 then
      board:move(board.emptyIndex, p2Index)
    end
  end
end

function board:moveUp()
  local p1 = board.pieces[board.emptyIndex]
  local p2Index

  if p1.y ~= 0 then
    p2Index = board:getIndexFromPosition(p1.x, p1.y - PieceSize)

    if p2Index ~= -1 then
      board:move(board.emptyIndex, p2Index)
    end
  end
end

function board:moveRight()
  local p1 = board.pieces[board.emptyIndex]
  local p2Index

  if p1.x ~= 400 then
    p2Index = board:getIndexFromPosition(p1.x + PieceSize , p1.y)

    if p2Index ~= -1 then
      board:move(board.emptyIndex, p2Index)
    end
  end
end

function board:moveLeft()
  local p1 = board.pieces[board.emptyIndex]
  local p2Index

  if p1.x ~= 0 then
    p2Index = board:getIndexFromPosition(p1.x - PieceSize , p1.y)

    if p2Index ~= -1 then
      board:move(board.emptyIndex, p2Index)
    end
  end
end

function board:getIndexFromPosition(x, y)
  for k, v in ipairs(board.pieces) do
    if v.x == x and v.y == y then
      return k
    end
  end

  return -1
end