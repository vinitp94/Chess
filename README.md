# Chess

This is a Ruby implementation of the classic game, Chess. To play, simply clone the repository on your machine and with ruby installed, run the command "ruby game.rb".

## Implementation

#### File Structure

The file tree contains a folder that stores all the pieces, a board class to track all the pieces, a cursor class to display a cursor on the grid, a display class that handles rendering, a game class that handles the two players and toggles between them, and the player class which defines a turn for each player. Below, the most interesting parts of the implementation are highlighted.

#### Board

This file is responsible for populating and keeping track of all the pieces in the game while also enforcing the rules of chess such as monitoring checks and checkmates.

  ```ruby
  def initialize
    @grid = Array.new(8) { Array.new(8) }
    @black_king = King.new(:red, [0, 4], self)
    @white_king = King.new(:white, [7, 4], self)
    populate
    @display = Display.new(self)
  end
  ```

#### Pieces

All of the pieces are stored in their own files in the [pieces][pieces] folder. Because many pieces share similar types of movements, they are divided into two types: SteppingPiece and SlidingPiece. A module is created for each and the pieces that require those type of movements use these modules. For example, the queen, rooks, and bishops all include the SlidingPiece module while the king and knights include the SteppingPiece module. All of the pieces on the board inherit methods from the Piece class.

  ```ruby
  module SteppingPiece
    def get_moves
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
    def get_moves
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
  ```

## Future Improvements

- Add an AI computer opponent
- Convert to browser game using JavaScript
- Highlight all potential moves on each turn

[pieces]: ./pieces
