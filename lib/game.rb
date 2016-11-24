require_relative 'player'

class Poker

  def initialize(players, pot)
  end

  def compare_hands(players)
    best_score = nil
    best_player = nil
    players.each do |player|
      if best_score.nil? || compare_scores(player.score, best_score)
        best_score = player.score
        best_player = player
      end
    end

    best_player
  end

  def compare_scores(score1, score2)
    flat_score1 = score1.flatten
    flat_score2 = score2.flatten
    flat_score1.length.times do |i|
      return true if flat_score1[i] > flat_score2[i]
      return false if flat_score1[i] < flat_score2[i]
    end
  end
end
