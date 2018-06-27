require "colorize"
require_relative "cursor"
require_relative "board"
class Display
  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], board)
  end

  def render
    puts "X  0  1  2  3  4  5  6  7"
    idx = 0
    while idx < 8
      string = ""
      i = 0
      while i < 8
        pos = [idx, i]
        color = (i + idx).even? ? :white : :black
        if @cursor.selected.include?(pos)
          string += " #{@board[pos].inspect}".colorize(:color=>:light_yellow)
        elsif pos == @cursor.cursor_pos
          string += "  #{@board[pos].inspect} ".colorize(:color=>:green, :background=>:orange)
        elsif @board[pos].is_a?(NullPiece)
          string += " #{@board[pos].inspect}  ".colorize(:background=>color)
        else
          string += "  #{@board[pos].inspect}".colorize(:color=>@board[pos].color, :background=>color)
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
      #return selected position
      @cursor.get_input
      if @cursor.selected.length == 2
        selected_pos = @cursor.selected.pop
        next_pos = @cursor.selected.pop
        if @board[next_pos].possible_moves.include?(selected_pos)
          @board.move_piece(selected_pos, next_pos)

          @board[selected_pos].move_dirs(selected_pos)
        end
      end
      system ("clear")
      self.render
    end
  end
end

if $PROGRAM_NAME == __FILE__
  d = Display.new(Board.new)
  d.play
end
