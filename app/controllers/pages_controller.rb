class PagesController < ApplicationController
  def home
    @games = Game.all
    @players = Player.sort_by_total_cash
  end
end