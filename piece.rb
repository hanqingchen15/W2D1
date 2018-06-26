module SlidingPiece
  def moves

  end
  private
  def move_diffs
  end
end

module SteppingPiece

end

class Piece
  attr_reader :color, :name
  PIECES = {[0, 0] => "Rok", [0, 7] => "Rok", [7, 0] => "Rok", [7, 7] => "Rok",
    [0, 1] => "Knt", [7, 1] => "Knt", [0, 6] => "Knt", [7, 6] => "Knt",
    [0, 2] => "Bsp", [0, 5] => "Bsp", [7, 2] => "Bsp", [7, 5] => "Bsp",
    [0, 3] => "Qen", [7, 3] => "Qen",
    [0, 4] => "Kng", [7, 4] => "Kng",
  }
  def initialize(coordinate)
    if coordinate.first == 1 || coordinate.first == 6
      @name = "Pwn"
    else
      @name = PIECES[coordinate]
    end
      @coordinate = coordinate
    if coordinate.first == 0 || coordinate.first == 1
      @color = :red
    else
      @color = :blue
    end
  end


  def moves

  end



  def inspect
    "#{@name}"
  end
end

class Rook < Piece
  def initialize
    super
  end

  def moves

  end
end

class Knight < Piece
  def initialize
    super
  end

  def moves

  end
end

class Bishop < Piece
  def initialize
    super
  end

  def moves

  end
end

class Queen < Piece
  def initialize
    super
  end

  def moves

  end
end

class King < Piece
  def initialize
    super
  end

  def moves

  end
end
