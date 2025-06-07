class Deal

  attr_accessor :west, :north, :east, :south

  def initialize(west, north, east, south)
    @west = west
    @north = north
    @east = east
    @south = south
  end

  # def cappelletti(a = 17, b = 2 )
  #   @west.weak_1NT? && @east.less_than?(a) && !@north.less_than?(b)
  # end

  def cappelletti(a = 15, b = 7)
    @west.weak_1NT? && @east.less_than?(a) && (@north.at_least54?(min_points: b) || @south.at_least54?(min_points: b))
  end

  # def dont(a = 15, b = 2 )
  #   @west.strong_1NT? && @east.less_than?(a) && !@north.less_than?(b)
  # end

  def dont(a = 15, b = 8)
    @west.strong_1NT? && @east.less_than?(a) && (@north.at_least54?(min_points: b) || @south.at_least54?(min_points: b))
  end

  def multi2d
    @west.multi2d?
  end

  def muiderberg
    @west.muiderberg?
  end

  def stayman(a = 7)
    @west._1NT? && @east._4card_major? && !@east.less_than?(a)
  end

  def smolen(a = 7)
    @west._1NT? && @east._4_5in_majors? && !@east.less_than?(a)
  end

  def garbage_stayman(a = 8)
    @west.strong_1NT? && @east._4_5in_majors? && @east.less_than?(a) ||
    @west.weak_1NT? && @east._4_5in_majors? && @east.less_than?(a + 3)
  end

  def weak2_defense
    @west.weak2?
  end

  def blackout
    @west.at_least54?(min_points: 16, max_points: 21) &&
    @east.no_support?(@west.nth_longest_suit(n: 1), @west.nth_longest_suit(n: 2)) &&
    !@east.balanced? &&
    @east.points.between?(5,14) &&
    @north.weak?(max_points:  10) && @south.weak?(max_points:  10)
  end

  def weak_multi_2c
    @west.weak2d?
  end
  
  def strong_multi_2c
    @west.strong2c?(23)
  end

end
