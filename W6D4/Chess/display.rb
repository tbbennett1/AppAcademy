require "colorize"
require_relative "board"
require_relative "cursor"

class Display
  attr_reader :board, :cursor, :notifications

  def initialize(board)
    @board = board
    @cursor = Cursor.new([0,0], @board)
    @notifications = {}
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

    @notifications.each do |_key, val|
      puts val
    end
  end

  def colors_for(i, j)
    if @cursor.cursor_pos == [i, j] && @cursor.selected
      bg = :grey
    elsif @cursor.cursor_pos == [i, j]
      bg = :green
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

  def reset!
    @notifications.delete(:error)
  end

  def uncheck!
    @notifications.delete(:check)
  end

  def set_check!
    @notifications[:check] = "Check!"
  end
end
# b = Board.new
# d = Display.new(b)
# d.render


