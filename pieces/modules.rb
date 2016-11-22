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
  def get_moves(move_dirs)
    valid_moves = []

    move_dirs.each do |move|
      i = 1
      while true
        x = move[0] * i + pos[0]
        y = move[1] * i + pos[1]

        if valid_move?([x, y])
          valid_moves << [x, y]
          break if !board[[x, y]].is_a?(NullPiece) && board[[x, y]].color != color
        else
          break
        end
        i += 1
      end
    end
    valid_moves
  end
end
