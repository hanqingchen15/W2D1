require_relative "piece"
class Board
  PIECES = {[0, 0] => "♖", [0, 7] => "♖", [7, 0] => "♜", [7, 7] => "♜",
    [0, 1] => "♘", [7, 1] => "♞", [0, 6] => "♘", [7, 6] => "♞",
    [0, 2] => "♗", [0, 5] => "♗", [7, 2] => "♝", [7, 5] => "♝",
    [0, 3] => "♕", [7, 3] => "♛",
    [0, 4] => "♔", [7, 4] => "♚",}
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    setup
  end

  def setup

    @grid.each_with_index do |row, i|
        @grid[i].map!.with_index do |square, idx|
          pos =[i, idx]
          case
          when pos == [0,0] || pos == [0,7]
            square = Rook.new(:red, self, pos)
          when pos == [7,0] || pos == [7,7]
            square = Rook.new(:blue, self, pos)
          when pos == [0,1] || pos == [0,6]
            square = Knight.new(:red, self, pos)
          when pos == [7,1] || pos == [7,6]
            square = Knight.new(:blue, self, pos)
          when pos == [0, 2] || pos == [0, 5]
            square = Bishop.new(:red, self, pos)
          when pos == [7, 2] || pos == [7, 5]
            square = Bishop.new(:blue, self, pos)
          when pos == [0, 3]
            square = Queen.new(:red, self, pos)
          when pos == [0, 4]
            square = King.new(:red, self, pos)
          when pos == [7, 3]
            square == Queen.new(:blue, self, pos)
          when pos == [7, 4]
            square = King.new(:blue, self, pos)
          when pos[i] == 1
            square = Pawn.new(:red, self, pos)
          when pos[i] == 6
            square = Pawn.new(:blue, self, pos)
          else
            square = NullPiece.instance()
          end

          square = Piece.new(color, board, pos)
        end
      end
    end
  end

  def [](pos)
    row, col = pos
    grid[row][col]
  end

  def []=(pos, val)
    row, col = pos
    grid[row][col] = val
  end

  def row(num)
    @grid[num]
  end

  def move_piece(start, finish)
    raise "Start position is empty" if self[start].nil?
    raise "End position out of bounds" if Board.valid_pos?(finish)
    self[start], self[finish] = self[finish], self[start]
  end

  def self.valid_pos?(pos)
    pos.none?{|e|e > 7 || e < 0}
  end
end

#
# if $PROGRAM_NAME == __FILE__
#   b = Board.new
#   p b
# end
