require "colorize"
require_relative "board"
require_relative "cursor"

class Display

    def initialize(board)
        @board = board
        @cursor = Cursor.new([0,0], @board)
    end

    def render
        #@cursor.cursor_pos
        # @cursor
        puts ("-------------------------------------------------").colorize(:blue)
        @board.rows.map.with_index do |row, i|
          row.map.with_index do |piece, j|
            color_options = colors_for(i, j)
            pic = piece.to_s.colorize(color_options) 
            print (("| ").colorize(:blue) + "#{pic}" + (" ").colorize(:blue))
          end
          puts ("|").colorize(:blue)
          puts ("-------------------------------------------------").colorize(:blue)
        end
    end

    def colors_for(i, j)
      if @cursor.cursor_pos == [i, j] && @cursor.selected
        bg = :light_green
      elsif @cursor.cursor_pos == [i, j]
        bg = :orange
      elsif (i + j).odd?
        bg = :red
      else
        bg = :blue
      end
      { background: bg }
    end

    def inspect
      @value = value
    end
end
b = Board.new
d = Display.new(b)
d.render



  # def build_grid
  #   @board.rows.map.with_index do |row, i|
  #     build_row(row, i)
  #   end
  # end

  # def build_row(row, i)
  #   row.map.with_index do |piece, j|
  #     color_options = colors_for(i, j)
  #     piece.to_s.colorize(color_options)
  #   end
  # end

