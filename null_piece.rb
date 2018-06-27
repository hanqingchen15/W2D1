require "singleton"

class NullPiece < Piece
  include Singleton
  attr_accessor :color

  def initialize
    @color = :black
  end

  def moves
  end

  def symbol
  end
  def inspect
    "  "
  end
end
