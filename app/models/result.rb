class Result < ActiveRecord::Base
  attr_accessible :game_id, :player_id, :score
  belongs_to :game
  belongs_to :player
end
