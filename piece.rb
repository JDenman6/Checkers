require_relative 'board'

class Piece

  attr_accessor :pos, :color, :grid

  def initialize(pos, color, grid)
    @color, @pos, @grid = color, pos, grid
    self.grid
  end

  def to_s
    "#{self.color}"
  end

  def side_forward(color)
    (color == :r) ? +1 : -1
  end

  def left(pos)
    row, col = pos
    row += side_forward(self.color)
    col += side_forward(self.color)
    pos = [row, col]
  end

  def right(pos)
    row, col = pos
    row += side_forward(self.color)
    col -= side_forward(self.color)
    pos = [row, col]
  end

  def slide_moves
    [left(self.pos) , right(self.pos)]
  end

  def jump_moves
    possible_jumps = []
    unless grid[left(self.pos)].nil?
      if grid[left(self.pos)].color != self.color &&
          grid[left(left(pos))].nil?
        possible_jumps << left(left(pos))
      end
    end
    unless grid[right(self.pos)].nil?
      if grid[right(self.pos)].color != self.color &&
          grid[right(right(pos))].nil?
        possible_moves << right(right(pos))
      end
    end
    possible_jumps
  end

end


if __FILE__ == $PROGRAM_NAME

    board = Board.new

    board.add_piece([0,2], :r)
    board.add_piece([1,3], :b)
    board.render

    p board[[0,2]].jump_moves

end
