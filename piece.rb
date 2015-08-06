class Piece
  attr_reader :color
  attr_accessor :pos

  def initialize(pos, color)
    @color = color
    @pos = pos
  end


end
