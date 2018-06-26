class Piece
  attr_reader :color, :name

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def moves
  end

  def inspect
    "#{@name}"
  end
end
