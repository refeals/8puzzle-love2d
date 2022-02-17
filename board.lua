Board = {}
PieceSize = 200

function CreateBoard()
  require "piece"

  Board.x = 0
  Board.y = 0

  Board.pieces = {}
  for i=1, 9 do
    local offsetX = (i - 1) % 3
    local offsetY = math.floor((i - 1) / 3)
    local ps = CreatePiece(i, Board.x + PieceSize * offsetX, Board.y + PieceSize * offsetY)
    table.insert(Board.pieces, ps)
  end

  Board.emptyIndex = 9
end

function Board:update(dt)
  function love.keypressed(key)
    if key == "up" then
      Board:moveDown()
    end
    if key == "down" then
      Board:moveUp()
    end
    if key == "left" then
      Board:moveRight()
    end
    if key == "right" then
      Board:moveLeft()
    end
  end
end

function Board:draw(dt)
  for i, p in pairs(Board["pieces"]) do
    p:draw(dt)
  end
end

function Board:move(p1, p2)
  local x, y = Board.pieces[p1].x, Board.pieces[p1].y
  Board.pieces[p1].x, Board.pieces[p1].y = Board.pieces[p2].x, Board.pieces[p2].y
  Board.pieces[p2].x, Board.pieces[p2].y = x, y
end

function Board:moveDown()
  local p1 = Board.pieces[Board.emptyIndex]
  local p2Index

  if p1.y ~= 400 then
    p2Index = Board:getIndexFromPosition(p1.x, p1.y + PieceSize)

    if p2Index ~= -1 then
      Board:move(Board.emptyIndex, p2Index)
    end
  end
end

function Board:moveUp()
  local p1 = Board.pieces[Board.emptyIndex]
  local p2Index

  if p1.y ~= 0 then
    p2Index = Board:getIndexFromPosition(p1.x, p1.y - PieceSize)

    if p2Index ~= -1 then
      Board:move(Board.emptyIndex, p2Index)
    end
  end
end

function Board:moveRight()
  local p1 = Board.pieces[Board.emptyIndex]
  local p2Index

  if p1.x ~= 400 then
    p2Index = Board:getIndexFromPosition(p1.x + PieceSize , p1.y)

    if p2Index ~= -1 then
      Board:move(Board.emptyIndex, p2Index)
    end
  end
end

function Board:moveLeft()
  local p1 = Board.pieces[Board.emptyIndex]
  local p2Index

  if p1.x ~= 0 then
    p2Index = Board:getIndexFromPosition(p1.x - PieceSize , p1.y)

    if p2Index ~= -1 then
      Board:move(Board.emptyIndex, p2Index)
    end
  end
end

function Board:getIndexFromPosition(x, y)
  for k, v in ipairs(Board.pieces) do
    if v.x == x and v.y == y then
      return k
    end
  end

  return -1
end