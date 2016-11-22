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
