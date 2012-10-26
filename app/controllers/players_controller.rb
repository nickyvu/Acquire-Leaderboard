class PlayersController < ApplicationController
  before_filter :authenticate_admin!
  def new
    @player = Player.new()
  end
  
  def create
    @player = Player.create(params[:player])
    if @player.save
      redirect_to players_path
    else
      render 'new'
    end
  end
  
  def index
    @players = Player.all
  end
end
