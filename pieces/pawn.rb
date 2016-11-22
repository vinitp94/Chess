require_relative 'piece'

class Pawn < Piece
  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = :p
  end

  def move_dirs
    if color == "black"
      [[1, 0], [1, 1], [1, -1]]
    else
      [[-1, 0], [-1, 1], [-1, -1]]
    end
  end

  def get_moves(move_dirs)
    valid_moves = []

    move_dirs.each_with_index do |move, i|
      x = move[0] + pos[0]
      y = move[1] + pos[1]

      is_empty = board[[x, y]].is_a?(NullPiece)
      is_valid = valid_move?([x, y])

      if i == 0
        valid_moves << [x, y] if is_valid && is_empty
      else
        valid_moves << [x, y] if is_valid && !is_empty
      end
    end
    valid_moves
  end
end
