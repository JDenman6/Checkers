require_relative 'piece.rb'

class Board
  GRID_SIZE = 8
  attr_accessor :grid

  def initialize
    @grid = Array.new(GRID_SIZE) { Array.new(GRID_SIZE) }
  end

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
  end

  def [](pos)
    x, y = pos
    grid[x][y]
  end

  def []=(pos, piece)
    x, y = pos
    self.grid[x][y] = piece
  end

  def add_piece(pos, color)
    self[pos] = Piece.new(pos, color)
  end

end


if __FILE__ == $PROGRAM_NAME
  board = Board.new

  board.add_piece([0,2], :r)
  # board[[0,0]] = Piece.new([2,3], :black)
  board.render


end
