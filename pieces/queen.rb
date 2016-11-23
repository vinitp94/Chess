require_relative 'piece'
require_relative 'modules'
require 'colorize'

class Queen < Piece
  include SlidingPiece

  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = "♕".colorize(color)
  end

  def move_dirs
    [[1, 1], [-1, -1], [-1, 1], [1, -1], [0, 1], [0, -1], [1, 0], [-1, 0]]
  end
end
