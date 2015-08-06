class Piece

  attr_accessor :pos, :color

  def initialize(pos, color)
    @color = color
    @pos = pos
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
    [left(left(pos)), right(right(pos))]
  end

end


if __FILE__ == $PROGRAM_NAME
  red = Piece.new([0,2], :r)
  black = Piece.new([7,5], :b)

  p red.jump_moves

  # p "red - left, right"
  # p red.moves
  # p "black - left, right"
  # p black.moves
end
