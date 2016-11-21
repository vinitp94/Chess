require_relative "piece"

class Board
  attr_reader :grid

  def initialize
    @grid = Array.new(8) { Array.new(8) }
  end

  def populate
    self[[0, 4]] = Queen.new("black")
    self[[0, 3]] = King.new("black")
    self[[0, 2]], self[[0, 5]] = Bishop.new("black"), Bishop.new("black")
    self[[0, 1]], self[[0, 6]] = Knight.new("black"), Knight.new("black")
    self[[0, 0]], self[[0, 7]] = Rook.new("black"), Rook.new("black")
    (0..7).to_a.each { |el| self[[1, el]] = Pawn.new("black") }

    self[[7, 3]] = Queen.new("white")
    self[[7, 4]] = King.new("white")
    self[[7, 2]], self[[7, 5]] = Bishop.new("white"), Bishop.new("white")
    self[[7, 1]], self[[7, 6]] = Knight.new("white"), Knight.new("white")
    self[[7, 0]], self[[7, 7]] = Rook.new("white"), Rook.new("white")
    (0..7).to_a.each { |el| self[[6, el]] = Pawn.new("white") }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, value)
    row, col = pos
    @grid[row][col] = value
  end
end
