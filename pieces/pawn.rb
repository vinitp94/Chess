require_relative 'piece'
require 'colorize'

class Pawn < Piece
  def initialize(color, pos, board)
    super(color, pos, board)
    @symbol = "♙".colorize(color)
  end

  def move_dirs
    if color == :red
      [[1, 0], [1, 1], [1, -1], [2, 0]]
    else
      [[-1, 0], [-1, 1], [-1, -1], [-2, 0]]
    end
  end

  def get_moves
    valid_moves = []

    move_dirs.each_with_index do |move, i|
      x = move[0] + pos[0]
      y = move[1] + pos[1]

      is_empty = board[[x, y]].is_a?(NullPiece)
      is_valid = valid_move?([x, y])

      if i == 0
        valid_moves << [x, y] if is_valid && is_empty
      elsif i == 3
        if pos[0] == 1 && color == :red
          valid_moves << [x, y] if is_valid && is_empty
        elsif pos[0] == 6 && color == :white
          valid_moves << [x, y] if is_valid && is_empty
        end
      else
        valid_moves << [x, y] if is_valid && !is_empty
      end
    end
    valid_moves
  end
end
