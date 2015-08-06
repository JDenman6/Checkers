class Board
  GRID_SIZE = 8
  attr_reader :grid

  def initialize
    @grid = Array.new(GRID_SIZE) { Array.new(GRID_SIZE, "[ ]") }
  end

  def render
    grid.each do |row|
     row.each { |square| print square }
     print "\n"
   end
  end
end


if __FILE__ == $PROGRAM_NAME
  board = Board.new

  board.render

end
