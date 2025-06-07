class Deck # :nodoc:
  SUITS = %w[C D H S].freeze
  CARDS = 13
  PLAYERS = 4
  attr_accessor :cards

  def initialize
    @cards = []
    build_deck
  end

  def shuffle
    @cards.shuffle!
    self
  end

  def deal
    hands = []
    PLAYERS.times do |player_index|
       hands <<  Hand.new(@cards.slice!(0, CARDS), player_index)
     end
    hands
  end

  def to_s
    @cards.map do |card|
      "#{card.rank}#{card.suit}"
    end
  end

  def spin
    shuffle
    hands = self.deal
    Deal.new(hands[0], hands[1], hands[2], hands[3])
  end

  def deal_one_hand
    Hand.new(@cards.slice!(0, CARDS), 0)
  end

  private

  def build_deck
    SUITS.each do |suit|
      1.upto(13) do |value|
        @cards << Card.new(suit, value)
      end
    end
  end
end
