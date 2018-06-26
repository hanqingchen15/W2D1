require "colorize"
require_relative "cursor"
require_relative "board"
class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    puts "X   0    1    2    3    4    5    6    7"
    idx = 0
    while idx < 8
      string = ""
      i = 0
      while i < 8
        pos = [idx, i]
        if pos == @cursor.cursor_pos
          string += "  #{@board[pos].inspect}".colorize(:green)
        elsif @board[pos].nil?
          string += "  #{@board[pos].inspect}"
        else
          string += "  #{@board[pos].inspect}".colorize(@board[pos].color)
        end
        i += 1
      end
      puts "#{idx} #{string}"
      idx += 1
    end
  end

  def play
    self.render
    while true
      @cursor.get_input
      system ("clear")
      self.render

    end
  end
end

if $PROGRAM_NAME == __FILE__
  d = Display.new(Board.new)
  d.play
end
