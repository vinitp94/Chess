require 'colorize'

class HumanPlayer
  attr_accessor :color, :board
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def play_turn
    begin
      cursor_start = cursor_input("#{name}, choose a piece you would like to move.\n\n")
      board.valid_start?(cursor_start, color)
    rescue StandardError => e
      puts e.message
      sleep(2)
      retry
    end
    board[cursor_start].symbol = board[cursor_start].symbol.colorize(:blue)
    begin
      cursor_end = cursor_input("#{name}, you selected: #{cursor_start}\n" +
      "Choose a position to move to.")
      board.valid_end?(cursor_start, cursor_end)
    rescue StandardError => e2
      puts e2.message
      sleep(2)
      retry
    end
    board[cursor_start].symbol = board[cursor_start].symbol.colorize(color)
    board.move_piece(cursor_start, cursor_end)
  end

  private

  def cursor_input(msg)
    cursor_start = nil
    while cursor_start.nil?
      system('clear')
      puts msg
      puts ""
      board.render
      cursor_start = board.display.cursor.get_input
    end
    cursor_start
  end
end
