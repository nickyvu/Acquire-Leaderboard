class PagesController < ApplicationController
  def home
    @games = Game.find(:all, :order => 'id desc')
    @players = Player.sort_by_total_cash
  end
end