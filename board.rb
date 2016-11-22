require_relative "pieces/piece"
require_relative "pieces/bishop"
require_relative "pieces/rook"
require_relative "pieces/queen"
require_relative "pieces/king"
require_relative "pieces/knight"
require_relative "pieces/pawn"
require_relative "display"

class Board
  attr_reader :grid, :black_king, :white_king

  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @black_king = King.new("black", [0, 3], self)
    @white_king = King.new("white", [7, 4], self)
    populate
  end

  def populate
    self[[0, 4]] = Queen.new("black", [0, 4], self)
    self[[0, 3]] = black_king
    self[[0, 2]], self[[0, 5]] = Bishop.new("black", [0, 2], self), Bishop.new("black", [0, 5], self)
    self[[0, 1]], self[[0, 6]] = Knight.new("black", [0, 1], self), Knight.new("black", [0, 6], self)
    self[[0, 0]], self[[0, 7]] = Rook.new("black", [0, 0], self), Rook.new("black", [0, 7], self)
    (0..7).to_a.each { |el| self[[1, el]] = Pawn.new("black", [1, el], self) }

    self[[7, 3]] = Queen.new("white", [7, 3], self)
    self[[7, 4]] = white_king
    self[[7, 2]], self[[7, 5]] = Bishop.new("white", [7, 2], self), Bishop.new("white", [7, 5], self)
    self[[7, 1]], self[[7, 6]] = Knight.new("white", [7, 1], self), Knight.new("white", [7, 6], self)
    self[[7, 0]], self[[7, 7]] = Rook.new("white", [7, 0], self), Rook.new("white", [7, 7], self)
    (0..7).to_a.each { |el| self[[6, el]] = Pawn.new("white", [6, el], self) }

    (2..5).to_a.each do |i|
      (0..7).to_a.each do |j|
        self[[i, j]] = NullPiece.instance
      end
    end
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end

  def in_bounds?(pos)
    pos.all? { |el| el.between?(0, 7) }
  end

  def move_piece(start_pos, end_pos)
    piece = self[start_pos]
    if piece.is_a?(NullPiece)
      raise StandardError.new "No piece at that position."
    end

    if piece.get_moves.include?(end_pos)
      self[start_pos] = NullPiece.instance
      piece.pos = end_pos
      self[end_pos] = piece
    else
      raise StandardError.new "Invalid End Position"
    end
  end

  def in_check?(color)
    if color == "white"
      combined_moves("black").include?(white_king.pos)
    elsif color == "black"
      combined_moves("white").include?(black_king.pos)
    end
  end

  def combined_moves(color)
    pieces_left(color).map(&:get_moves).inject(&:+)
  end

  def pieces_left(color)
    pieces = []
    8.times do |row|
      8.times do |col|
        pieces << self[[row, col]] if self[[row, col]].color == color
      end
    end
    pieces
  end

  def checkmate?(color)
  end
end

if $PROGRAM_NAME == __FILE__
  b = Board.new
  b.populate
  d = Display.new(b)
  d.render
  sleep(2)
  system('clear')
  b.move_piece([1, 3], [2, 3])
  d.render
  p b[[2, 3]].get_moves
  b.move_piece([0, 4], [2, 2])
  system('clear')
  d.render
  b.move_piece([2, 2], [6, 2])
  system('clear')
  d.render

  p b.in_check?("white")
  b.move_piece([6, 2], [7, 3])
  sleep(2)
  system('clear')
  d.render
  p b.in_check?("white")

end
