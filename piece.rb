module SteppingPiece
  def get_moves(move_dirs)
    valid_moves = []

    move_dirs.each do |move|
      x = move[0] + pos[0]
      y = move[1] + pos[1]
      valid_moves << [x, y] if valid_move?([x, y])
    end
    valid_moves
  end
end

module SlidingPiece
  def move(move_dirs)
    valid_moves = []

    move_dirs.each do |move|
      i = 1
      while true
        x = move[0] * i + pos[0]
        y = move[1] * i + pos[1]

        if valid_move?([x, y])
          valid_moves << [x, y]
        else
          break
        end
        i += 1
      end
    end
    valid_moves
  end
end

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

class Pawn < Piece
  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :p
  end
end

class King < Piece
  include SteppingPiece

  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :K
  end

  def move_dirs
    [[1, 0], [0, 1], [0, -1], [-1, 0], [1, 1], [1, -1], [-1, 1], [-1, -1]]
  end
end

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
