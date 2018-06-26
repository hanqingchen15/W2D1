module Slideable
  HORIZONTAL_DIRS = [[-1, 0],[0, -1],[0, 1],[1, 0]]
  DIAGONAL_DIRS = [[-1, -1],[-1, 1],[1, -1],[1, 1]]

  def horizontal_dirs
    HORIZONTAL_DIRS
  end

  def diagonal_dirs
    DIAGONAL_DIRS
  end

  def moves
    moves = []
    move_dirs.each do |dx, dy|
      moves += expand(dx, dy)
    end
    moves
  end

  private

  def move_dirs
    raise "Needs to be overwrittter"
  end

  def expand(dx, dy)
    x, y = pos
    moves = []
    loop do
      pos = [x + dx, y + dy]
      break unless board.valid_pos?(pos)

      if board.empty?(pos)
        moves << pos
      else
        moves << pos unless board[pos].color == color
        break
      end
    end
    moves
  end
end

module Stepable
  def moves
    move_diffs.each_with_object([]) do |(dx, dy), moves|
      x, y = pos
      pos = [x + dx, y + dy]
      next unless board.valid_pos?(pos)

      if board.empty?(pos) || board[pos].color != color
        moves << pos
      end
    end
  end

  private

  def move_diffs
    raise "Needs to be overwritten"
  end
end
