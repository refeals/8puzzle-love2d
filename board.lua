board = {}
pieceSize = 200

function createBoard()
  require "piece"

  board.x = 0
  board.y = 0

  board.pieces = {
    createPiece(1, board.x + pieceSize * 0, board.y + pieceSize * 0),
    createPiece(2, board.x + pieceSize * 1, board.y + pieceSize * 0),
    createPiece(3, board.x + pieceSize * 2, board.y + pieceSize * 0),
    createPiece(4, board.x + pieceSize * 0, board.y + pieceSize * 1),
    createPiece(5, board.x + pieceSize * 1, board.y + pieceSize * 1),
    createPiece(6, board.x + pieceSize * 2, board.y + pieceSize * 1),
    createPiece(7, board.x + pieceSize * 0, board.y + pieceSize * 2),
    createPiece(8, board.x + pieceSize * 1, board.y + pieceSize * 2),
    createPiece(9, board.x + pieceSize * 2, board.y + pieceSize * 2)
  }
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
