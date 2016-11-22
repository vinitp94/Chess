class Piece
  attr_reader :color, :board, :symbol
  attr_accessor :pos

  def initialize(color, pos, board)
    @color = color
    @pos = pos
    @board = board
  end

  def to_s
    symbol.to_s
  end

  def valid_move?(pos)
    if !in_bounds?(pos) || board[pos].color == color
      return false
    end
    true
  end

  def in_bounds?(pos)
    pos.all? { |el| el.between?(0, 7) }
  end
end

class NullPiece < Piece
  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :_
  end
end
