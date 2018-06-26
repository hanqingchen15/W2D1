require_relative "piece"
class Board
  attr_reader :grid
  def initialize
    @grid = Array.new(8) {Array.new(8)}
    @grid.each_with_index do |row, i|
      if i < 2 || i > 5
        @grid[i].map!.with_index do |square, idx|
          coordinate =[i, idx]
          square = Piece.new(coordinate)
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
