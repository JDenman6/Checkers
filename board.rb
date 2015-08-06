require_relative 'piece.rb'

class Board
  GRID_SIZE = 8
  attr_accessor :grid

  def initialize
    @grid = Array.new(GRID_SIZE) { Array.new(GRID_SIZE) }
  end

  # def setup
  #   grid.each_with_index do |row, row_idx|
  #     row.each_with_index do |col, col_idx|
  #       if row_idx.between?(0,2) &&
  #     end
  #   end
  # end

  def render
    grid.each do |row|
     row.each do |square|
       if square.nil?
         print "[ ]"
       else
         print "[#{square.to_s}]"
       end
     end
     print "\n"
    end
    print "~~~~~~~~~~~~~~~~~~~~~~~~\n"
  end

  def dup
    new_grid = Board.new
    pieces = self.grid.flatten.compact

    pieces.each do |piece|
        new_grid.add_piece(piece.pos, piece.color)
    end

    new_grid
  end

  def add_piece(pos, color)
    self[pos] = Piece.new(pos, color, self)
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    self.grid[x][y] = piece
  end

  def move!(from_pos, to_pos)
    self[to_pos], self[from_pos] = self[from_pos], self[to_pos]
    self[to_pos].pos = to_pos
  end

  def clear_space(pos)
    self[pos] = nil
  end

  def on_board?(pos)
    pos.all? { |coordinate| (0...GRID_SIZE).include?(coordinate) }
  end

end


if __FILE__ == $PROGRAM_NAME
board = Board.new

board.add_piece([2,4], :b)
board.add_piece([4,2], :r)
board.add_piece([2,2], :b)
board.add_piece([4,6], :r)
board.render




end
