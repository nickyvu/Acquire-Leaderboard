class Game < ActiveRecord::Base
  attr_accessible :location, :date, :results_attributes
  has_many :results
  accepts_nested_attributes_for :results
  
  def total_ending_cash
    self.results.sum{|x| x.score}
  end
  
  def sorted_results
    self.results.sort_by{|obj| obj.score}.reverse
  end
end
