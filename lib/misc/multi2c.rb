# bin/rails runner 'load "lib/misc/multi2c.rb"'
include ActionView::Helpers::NumberHelper
weak_multi_2cs = 0
strong_multi_2cs = 0
Ordered_cards = Deck.new.cards
n = 100_000
(1..n).each do |i|
  # the Deck class's deal method uses slice on deck.cards array redcuing it to [] after each deal
  deck = Deck.new
  # without the dup method Ordered_cards itself gets reduced to [] when deck is dealt
  deck.cards = Ordered_cards.dup
  deck.shuffle
  hand = deck.deal_one_hand
  # deal = Deal.new(hand, hand, hand, hand)
  if hand.weak2d?
    weak_multi_2cs += 1
    # output << [hand.points, hand.distribution_summary]
  end
  if hand.strong2c?(23)
    strong_multi_2cs += 1
    # output << [hand.points, hand.cards[0,13]]
  end
  # output << [hand.points, hand.distribution_summary,  weak_multi_2cs, stong_multi_2cs]
end

# puts output
puts "weak multi 2cs: #{number_to_percentage(100.to_f * weak_multi_2cs / n, precision: 2)}"
puts "strong multi2cs: #{number_to_percentage(100.to_f * strong_multi_2cs / n, precision: 2)}"
