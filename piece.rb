class Piece
  attr_reader :color, :name

  def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
  end

  def valid_moves
    possible_moves = self.possible_moves
    possible_moves.reject! do |move|
      board[move].color == self.color
    end
  end

  def inspect
    "#{@symbol}"
  end
end
