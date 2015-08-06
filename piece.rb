require_relative 'board'

class Piece

  RED_DELTAS = [[-1, -1], [-1, 1]]
  BLACK_DELTAS = [[1, -1], [1, 1]]

  attr_accessor :pos, :color, :grid

  def initialize(pos, color, grid)
    @color, @pos, @grid = color, pos, grid
    self.grid
  end

  def to_s
    "#{self.color}"
  end

  def slide_moves
    [left(self.pos) , right(self.pos)]
  end

  def deltas
    (self.color == :r) ? RED_DELTAS : BLACK_DELTAS
  end

  def slide_moves
    possible_moves = []
    row, col = self.pos
    deltas.each do |delta|
      row_delta, col_delta = delta
      possible_moves << [row + row_delta, col + col_delta]
    end

    possible_moves
  end

  def jump_moves
    possible_jumps = []
    row, col = self.pos
    deltas.each do |delta|
      row_delta, col_delta = delta
      possible_jumps << [row + (2 * row_delta), col + (2 * col_delta)]
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
