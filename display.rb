require 'colorize'
require_relative 'cursor'

class Display
  attr_reader :board, :cursor

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0, 0], board)
  end

  def render
    board.grid.each_index do |row|
      arr = board.grid[row].each_with_index.map do |el, col|
        if cursor.cursor_pos == el.pos
          el.to_s.colorize(:blue)
        elsif el.pos.nil?
          if [row, col] == cursor.cursor_pos
            "_".colorize(:blue)
          else
            el.to_s
          end
        else
          el.to_s
        end
      end
      puts arr.join(" ")
    end
    puts "Check!" if board.check?
  end
end
