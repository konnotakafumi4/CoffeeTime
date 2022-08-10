class Public::FavoritesController < ApplicationController
  def index
  end

  def create
    @coffee = Coffee.find(params[:coffee_id])
    favorite = current_end_user.favorites.new(coffee_id: @coffee.id)
    favorite.save
    #redirect_to request.referer(非同期通信化にするためリダイレクト先削除)
  end

  def destroy
    @coffee = Coffee.find(params[:coffee_id])
    favorite = current_end_user.favorites.find_by(coffee_id: @coffee.id)
    favorite.destroy
    #redirect_to request.referer(非同期通信化にするためリダイレクト先削除)
  end
end