require_relative 'board'
require_relative 'player'

require 'byebug'

class Game
  attr_reader :board, :current_player, :player1, :player2

  def initialize(player1, player2)
    @board = Board.new
    @player1, @player1.color = player1, :white
    @player2, @player2.color = player2, :red
    @player1.board = @board
    @player2.board = @board
    @current_player = @player1
  end

  def play
    until game_over?
      @current_player.play_turn
      switch_players
    end
    system('clear')
    board.render
    handle_winner
  end

  def game_over?
    board.checkmate?(player1.color) || board.checkmate?(player2.color) ||
      board.white_king.pos.nil? || board.black_king.pos.nil?
  end

  def handle_winner
    switch_players
    puts "Game over. #{current_player.name} wins!"
  end

  def switch_players
    if @current_player == player1
      @current_player = player2
    elsif @current_player == player2
      @current_player = player1
    end
  end
end

if $PROGRAM_NAME == __FILE__
  p1 = HumanPlayer.new("P1")
  p2 = HumanPlayer.new("P2")
  game = Game.new(p1, p2)
  game.play
end
