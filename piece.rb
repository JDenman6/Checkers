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

  # def move(dir)
  #   slide_move(dir) if slide_available?(dir)
  #   jump_move(dir) if jump_available?(dir)
  #   raise "You can't move there!"
  # end

  def left
    row, col = self.pos
    row += side_forward(self.color)
    col += side_forward(self.color)
    pos = [row, col]
  end

  def right
    row, col = self.pos
    row += side_forward(self.color)
    col -= side_forward(self.color)
    pos = [row, col]
  end

end


if __FILE__ == $PROGRAM_NAME
  red = Piece.new([0,2], :r)
  black = Piece.new([7,5], :b)

  p "red - left, right"
  p red.left
  p red.right
  p "black - left, right"
  p black.left
  p black.right

end
