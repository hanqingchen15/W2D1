require 'byebug'
require_relative "piece"
require_relative "./chess_pieces/rook"
require_relative "./chess_pieces/knight"
require_relative "./chess_pieces/bishop"
require_relative "./chess_pieces/queen"
require_relative "./chess_pieces/king"
require_relative "./chess_pieces/pawn"
require_relative "null_piece"
class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    setup
  end

  def setup
    @grid.each_with_index do |row, i|
        @grid[i].each_with_index do |square, idx|
          pos =[i, idx]
          case pos
          when [0,0], [0,7]
            self[pos] = Rook.new(:red, self, pos)
          when [7,0], [7,7]
            self[pos] = Rook.new(:blue, self, pos)
          when [0,1], [0,6]
            self[pos] = Knight.new(:red, self, pos)
          when [7,1], [7,6]
            self[pos] = Knight.new(:blue, self, pos)
          when [0,2], [0,5]
            self[pos] = Bishop.new(:red, self, pos)
          when [7,2], [7,5]
            self[pos] = Bishop.new(:blue, self, pos)
          when [0,3]
            self[pos] = Queen.new(:red, self, pos)
          when [0,4]
            self[pos] = King.new(:red, self, pos)
          when [7,3]
            self[pos] = Queen.new(:blue, self, pos)
          when [7,4]
            self[pos] = King.new(:blue, self, pos)
          when [1,0], [1,1], [1,2], [1,3], [1,4], [1,5], [1,6], [1,7]
            self[pos] = Pawn.new(:red, self, pos)
          when [6,0], [6,1], [6,2], [6,3], [6,4], [6,5], [6,6], [6,7]
            self[pos] = Pawn.new(:blue, self, pos)
          else
            self[pos] = NullPiece.instance()
          end
          if pos[i] == 1
            square = Pawn.new(:red, self, pos)
          elsif pos [i] == 6
            square = Pawn.new(:blue, self, pos)
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
    raise "End position out of bounds" unless Board.valid_pos?(finish)
    self[start], self[finish] = self[finish], self[start]
  end

  def self.valid_pos?(pos)
    pos.none?{|e|e > 7 || e < 0}
  end
end
