class Game < ActiveRecord::Base
  attr_accessible :location, :date, :results_attributes
  has_many :results
  accepts_nested_attributes_for :results
  
  def total_ending_cash
    self.results.sum{|x| x.score}
  end
end
