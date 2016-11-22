require_relative 'piece'
require_relative 'modules'

class Bishop < Piece
  include SlidingPiece

  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :B
  end

  def move_dirs
    [[1, 1], [-1, -1], [-1, 1], [1, -1]]
  end
end

class Rook < Piece
  include SlidingPiece

  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :R
  end

  def move_dirs
    [[0, 1], [0, -1], [1, 0], [-1, 0]]
  end
end

class Queen < Piece
  include SlidingPiece

  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :Q
  end

  def move_dirs
    [[1, 1], [-1, -1], [-1, 1], [1, -1], [0, 1], [0, -1], [1, 0], [-1, 0]]
  end
end
