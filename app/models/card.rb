class Card # :nodoc:
  FACE_CARDS = { 11 => [:J, 1], 12 => [:Q, 2], 13 => [:K, 3], 14 => [:A, 4] }.freeze
  attr_accessor :rank, :suit, :value

  def initialize(suit, value)
    @suit = suit
    @value = value + 1 # as the cards start at 2 not 1
    @rank = FACE_CARDS[@value] ? FACE_CARDS[@value][0] : @value.to_s
  end

  def points
    FACE_CARDS[@value] ? FACE_CARDS[@value][1] : 0
  end

  def to_s
    "#{@rank}#{@suit}"
  end
end
