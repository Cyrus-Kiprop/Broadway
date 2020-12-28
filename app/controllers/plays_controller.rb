class PlaysController < ApplicationController

  before_action :find_play, only: [:show, :edit, :update, :destroy]

  def index
    @plays = Play.all.order("created_at DESC")
  end

  def new
    @play = Play.new
  end

  def show
    @play = find_play
  end

  def create
    @play = Play.new(play_params)
    if @play.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
    if @play.destroy
      redirect_to root_path
    end
  end


  private

  def play_params
    params.require(:play).permit(:title, :description, :director)
  end

  def find_play
    @play = Play.find(params[:id])
  end



end