require_relative 'piece'
require_relative 'modules'
require 'colorize'

class King < Piece
  include SteppingPiece

  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = "♔".colorize(color)
  end

  def move_dirs
    [[1, 0], [0, 1], [0, -1], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]
  end
end
