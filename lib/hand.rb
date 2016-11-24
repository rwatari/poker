require_relative 'deck'

class Hand
  attr_reader :cards

  def initialize
    @cards = []
  end

  def add_cards(cards_arr)
    @cards.concat(cards_arr)
  end

  def empty
    @cards = []
    @counted_cards = []
  end

  def discard(indicies)
    new_cards = []
    cards.each_with_index do |card, i|
      new_cards << card unless indicies.include?(i)
    end
    @cards = new_cards
  end

  def display
    cards.each do |card|
      print card.to_s + ' '
    end
  end

  def score
    count_cards

    if royal_flush
      [9, royal_flush]
    elsif straight_flush
      [8, straight_flush]
    elsif four_kind
      [7, four_kind]
    elsif full_house
      [6, full_house]
    elsif flush
      [5, flush]
    elsif straight
      [4, straight]
    elsif three_kind
      [3, three_kind]
    elsif two_pair
      [2, two_pair]
    elsif one_pair
      [1, one_pair]
    else
      [0, high_card]
    end
  end
  private

  attr_reader :counted_cards

  def card_values
    cards.map(&:value).sort { |x, y| y <=> x }
  end

  def royal_flush
    card_values.include?(14) && straight && flush ? [] : false
  end

  def straight_flush
    straight && flush ? [high_card.first] : false
  end

  def four_kind
    counted_cards.first[1] == 4 ? count_cards.map(&:first) : false
  end

  def full_house
    if counted_cards.first[1] == 3 && counted_cards[1][1] == 2
      count_cards.map(&:first)
    else
      false
    end
  end

  def flush
    cards.map(&:suit).uniq.size == 1 ? card_values : false
  end

  def straight
    if card_values.first.downto(card_values.last).to_a == card_values
      [card_values.first]
    elsif card_values == [14, 5, 4, 3, 2]
      [5]
    else
      false
    end
  end

  def three_kind
    counted_cards.first[1] == 3 ? count_cards.map(&:first) : false
  end

  def two_pair
    if counted_cards.first[1] == 2 && counted_cards[1][1] == 2
      count_cards.map(&:first)
    else
      false
    end
  end

  def one_pair
    counted_cards.first[1] == 2 ? count_cards.map(&:first) : false
  end

  def high_card
    card_values
  end


  def count_cards
    count_hash = Hash.new(0)
    card_values.each { |val| count_hash[val] += 1 }
    @counted_cards = sort_by_val_key(count_hash)
  end

  def sort_by_val_key(count_hash)
    count_hash.to_a.sort_by { |key, val| [-val, -key] }
  end
end
