class PlaysController < ApplicationController

  before_action :find_play, only: [:show, :edit, :update, :destroy]

  def index
    @category = Category.find_by(name: params[:category])
    if params[:category].blank?
      @plays = Play.all.order("created_at DESC")
    else
        @play = Play.where(category_id: @category.id).order("created_at DESC")
    end
  end

  def new
    @play = current_user.plays.build
    @categories = Category.all.map{ |c| [c.name, c.id]}
  end

  def show
    @play = find_play
  end

  def create
    @play = current_user.plays.build(play_params)
    @play[:category_id] = params[:category_id]
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
    params.require(:play).permit(:title, :description, :director, :category_id)
  end

  def find_play
    @play = Play.find(params[:id])
  end



end
