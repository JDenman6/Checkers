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

  def move(from_pos, dir)
    piece = self[from_pos]
    if dir == :left
      dir = piece.left
    elsif dir == :right
      dir = piece.right
    end
    if slide_available?(dir)
      slide_move(from_pos, dir)
    elsif jump_available?(dir)
      jump_move(dir)
    else
      raise "You can't move there!"
    end
  end

  def slide_move(from_pos, to_pos)
    self[to_pos], self[from_pos] = self[from_pos], self[to_pos]
    self[to_pos].pos = to_pos
  end

  def slide_available?(dir)
    true
  end

  def jump_available?(dir)
    true
  end

  def add_piece(pos, color)
    self[pos] = Piece.new(pos, color)
  end

end


if __FILE__ == $PROGRAM_NAME
  board = Board.new

  board.add_piece([0,2], :r)
  # board[[0,0]] = Piece.new([2,3], :black)
  board.add_piece([7,5], :b)
  board.render
  p "~~~~~~"
   board.move([7,5], :left)
  board.render
  p board[[3,4]].pos


end
