class Game < ActiveRecord::Base
  has_one :human_player
  has_many :computer_players

  def players
    computer_players + [human_player]
  end
end
