require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    board.grid.each do |row|
      puts row.map { |el| cursor.cursor_pos == el.pos ?
                    el.to_s.colorize(:red) : el.to_s }.join(" ")
    end
    nil
  end

  def play_turn
    while true
      render
      cursor.get_input
      system("clear")
    end
  end
end
