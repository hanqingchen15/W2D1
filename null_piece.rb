require "Singleton"

class NullPiece < Piece
  include Singleton
  #
  # def initialize(position)
  #   super
  # end

  def moves
  end

  def symbol
  end
end
