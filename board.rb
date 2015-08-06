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
    to_pos = set_to_pos(from_pos, dir)
    if slide_available?(to_pos)
      slide_move(from_pos, to_pos)
    elsif jump_available?(to_pos)
      jump_move(to_pos)
    else
      raise "You can't move there!"
    end
  end

  def set_to_pos(from_pos, dir)
    piece = self[from_pos]
    if dir == :left
      to_pos = piece.left
    elsif dir == :right
      to_pos = piece.right
    end

    to_pos
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

  p board.set_to_pos([7,5], :left)

   board.move([7,5], :left)
  board.render



end
