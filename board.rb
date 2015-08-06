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

  def move(from_pos, to_pos)
    piece = self[from_pos]
    if piece.moves.include?(to_pos) && on_board?(to_pos)
      slide_move(from_pos, to_pos)
    else
      raise "ERROR! in move"
    end

    nil
  end

  def slide_move(from_pos, to_pos)
    if self[to_pos].nil?
    self[to_pos], self[from_pos] = self[from_pos], self[to_pos]
    self[to_pos].pos = to_pos
    end

  nil
  end


  def jump_available?(dir)
    true
  end

  def add_piece(pos, color)
    self[pos] = Piece.new(pos, color)
  end

  def on_board?(pos)
    pos.all? { |coordinate| (0...GRID_SIZE).include?(coordinate) }
  end

end


if __FILE__ == $PROGRAM_NAME
  board = Board.new

  board.add_piece([0,2], :r)
  board.add_piece([7,5], :b)
  board.render
  p "~~~~~~"


  board.move([7,5], [6,4])
  board.render



end
