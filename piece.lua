function CreatePiece(pValue, pX, pY)
  local piece = {}
  piece.x = pX
  piece.y = pY
  piece.value = pValue

  function piece:draw(dt)
    love.graphics.setColor(255, 0, 0)
    love.graphics.rectangle("line", piece.x, piece.y, PieceSize, PieceSize)
    love.graphics.print(piece.value, piece.x + PieceSize/2, piece.y + PieceSize/2)
  end

  return piece
end
