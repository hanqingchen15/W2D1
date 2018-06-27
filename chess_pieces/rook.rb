class Rook < Piece
  def initialize(color, board, pos)
    super
    @symbol = "♜  "
    @possible_moves = []
    # move_dirs(pos)
  end

  # def move_dirs(pos)
  #   if at_start? && @color == :red
  #     @possible_moves << [pos[0] + 2, pos[1]]
  #   elsif at_start? && @color == :blue
  #     @possible_moves << [pos[0] -2, pos[1]]
  #   end
  #   if @color == :red
  #     @possible_moves << [pos[0] + 1, pos[1]]
  #   else
  #     @possible_moves << [pos[0] - 1, pos[1]]
  #   end
  # end


end
