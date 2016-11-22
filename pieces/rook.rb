require_relative 'piece'
require_relative 'modules'

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
