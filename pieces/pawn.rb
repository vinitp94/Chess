require_relative 'piece'

class Pawn < Piece
  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :p
  end
end
