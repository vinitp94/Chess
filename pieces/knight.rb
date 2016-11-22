require_relative 'piece'
require_relative 'modules'

class Knight < Piece
  include SteppingPiece

  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :k
  end

  def move_dirs
    [[2, 1], [2, -1], [1, 2], [1, -2], [-2, 1], [-2, -1], [-1, 2], [-1, -2]]
  end
end
