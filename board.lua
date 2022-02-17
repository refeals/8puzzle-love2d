board = {}
pieceSize = 200

function createBoard()
  require "piece"

  board.x = 0
  board.y = 0

  board.pieces = {}
  for i=1, 9 do
    local offsetX = (i - 1) % 3
    local offsetY = math.floor((i - 1) / 3)
    local ps = createPiece(i, board.x + pieceSize * offsetX, board.y + pieceSize * offsetY)
    table.insert(board.pieces, ps)
  end
end

function board:update(dt)
  for i, p in pairs(board["pieces"]) do
    p:update(dt)
  end
end

function board:draw(dt)
  for i, p in pairs(board["pieces"]) do
    p:draw(dt)
  end
end
