require_relative 'hand'

class Player
  attr_reader :name, :pot, :hand

  def initialize(name, pot)
    @name = name
    @pot = pot
    @hand = Hand.new
  end

  def get_discard
    puts "Choose up to 3 cards to discard (ex: 0, 1, 2)"
    input = gets.chomp.scan(/\d/).map(&:to_i)
    raise "Too many cards" if input.length > 3
    raise "Card index invalid" unless input.all? {|num| num.between?(0,4)}

    input
  rescue
    retry
  end

  def discard(arr)
    @hand.discard(arr)
  end

  def score
    @hand.score
  end

  def show_hand
    @hand.display
  end

  def get_bet
    puts "(B)et, (C)heck/call, or (F)old"
    input = gets.chomp.upcase
    case input
    when "B"
      puts "How much?"
      gets.chomp.to_i
    when "C"
      :c
    when "F"
      :f
    else
      raise "Invalid input"
    end
  rescue
    retry
  end

  def empty_hand
    @hand.empty
  end

  def take_cards(arr)
    @hand.add_cards(arr)
  end
end
