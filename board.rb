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
    print "~~~~~~~~~~~~~~~~~~~~~~~~\n"
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
    if self[from_pos].nil?
      raise "ERROR! No piece there."
    else
    piece = self[from_pos]
    end
    if on_board?(to_pos)
      if piece.slide_moves.include?(to_pos)
        slide_move(from_pos, to_pos)
      elsif piece.jump_moves.include?(to_pos)
        jump_move(from_pos, to_pos)
      else
        raise "ERROR! can't slide there."
      end
    else
      raise "ERROR! in move"
    end

    nil
  end

  def slide_move(from_pos, to_pos)
    if self[to_pos].nil?
      self[to_pos], self[from_pos] = self[from_pos], self[to_pos]
      self[to_pos].pos = to_pos
    else
      Raise "ERROR! in slide move"
    end

    nil
  end

  def jump_move(from_pos, to_pos)
    if self[to_pos].nil?
      self[jumped_space(from_pos, to_pos)] = nil
      self[to_pos], self[from_pos] = self[from_pos], self[to_pos]
      self[to_pos].pos = to_pos
    else
      raise "ERROR! Can't jump there."
    end
  end

  def jumped_space(from_pos, to_pos)
    start_x, start_y = from_pos
    end_x, end_y = to_pos

    jumped_x = (start_x + end_x) / 2
    jumped_y = (start_y + end_y) / 2

    [jumped_x, jumped_y]
  end


  def add_piece(pos, color)
    self[pos] = Piece.new(pos, color, self)
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
# board.add_piece([2,4], :b)
# board.add_piece([3,5], :r)
# board.add_piece([2,4], :b)
# board.add_piece([3,5], :r)
board.render




  # board.move([3,5], [1,3])
  # board.render



end
