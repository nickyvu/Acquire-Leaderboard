class GamesController < ApplicationController
  before_filter :authenticate_admin!
  
  def new
    @game = Game.new()
    4.times do |result|
      @game.results.new()
    end
  end
  
  def create
    @game = Game.create(params[:game])
    if @game.save
      redirect_to root_path
    else
      render 'new'
      flash[:error] = "Game could not be entered."
    end
  end
end
