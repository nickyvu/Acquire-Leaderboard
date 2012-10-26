class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :results
  validates :first_name, :presence => true
  validates :last_name, :presence  => true
  
  def name
    self.first_name + " " + self.last_name
  end
  
  def total_cash
    results = self.results.all
    results.sum {|x| x.score}
  end
  
  def self.sort_by_total_cash
    players = Player.all
    players.sort_by! {|p| p.total_cash}
    players.reverse!
  end
end
