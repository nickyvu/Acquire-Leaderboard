class Player < ActiveRecord::Base
  attr_accessible :first_name, :last_name
  has_many :results
  validates :first_name, :presence => true
  validates :last_name, :presence  => true, :uniqueness => {:scope => :first_name}
  
  def name
    self.first_name + " " + self.last_initial
  end
  
  def last_initial
    self.last_name.chr.upcase
  end
  
  def total_cash
    results = self.results.all
    results.sum {|x| x.score}
  end
  
  def per_game_average
    self.total_cash / self.results.size unless self.results.size == 0
  end
  
  def self.sort_by_total_cash
    players = Player.all
    players.sort_by! {|p| p.total_cash}
    players.reverse!
  end
end
