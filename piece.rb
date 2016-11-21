class Piece
  attr_reader :color

  def initialize(color)
    @color = color
  end
end

class Pawn < Piece
end

class King < Piece
end

class Knight < Piece
end

class NullPiece < Piece
end

class Bishop < Piece
end

class Rook < Piece
end

class Queen < Piece
end
