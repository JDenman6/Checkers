class Piece

  attr_accessor :pos, :color

  def initialize(pos, color)
    @color = color
    @pos = pos
  end

  def to_s
    "#{self.color}"
  end

end


if __FILE__ == $PROGRAM_NAME
  red = Piece.new([0,0], :r)

  p red.to_s
end
