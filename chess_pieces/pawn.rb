class Pawn < Piece
  attr_reader :possible_moves, :pos
  def initialize(color, board, pos)
    super
    @symbol = "♟  "
    @possible_moves = []
    move_dirs(pos)
  end

  def move_dirs(pos)
    if at_start? && @color == :red
      @possible_moves << [pos[0] + 2, pos[1]]
    elsif at_start? && @color == :blue
      @possible_moves << [pos[0] - 2, pos[1]]
    end
    if @color == :red
      @possible_moves << [pos[0] + 1, pos[1]]
    elsif @color == :blue
      @possible_moves << [pos[0] - 1, pos[1]]
    end

    # @possible_moves.select! {|move| @board[move].is_a?(NullPiece)}
  end

  def at_start?
    if pos[0] == 1 && color == :red
      return true
    elsif pos[0] == 6 && color == :blue
      return true
    else
      return false
    end
  end
end
