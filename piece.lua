function createPiece(pValue, pX, pY)
  local piece = {}
  piece.x = pX
  piece.y = pY
  piece.value = pValue

  function piece:update(dt)
  end

  function piece:draw(dt)
    love.graphics.setColor(255, 0, 0)
    -- love.graphics.print(tostring(piece.x) + ", " + tostring(piece.y), piece.x, piece.y)
    love.graphics.rectangle("line", piece.x, piece.y, pieceSize, pieceSize)
    love.graphics.print(piece.value, piece.x + pieceSize/2, piece.y + pieceSize/2)
  end

  return piece
end
