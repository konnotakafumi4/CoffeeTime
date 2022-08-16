class Admin::EndUsersController < ApplicationController
  def index
    @end_users = EndUser.all
  end

  def show
    @end_user = EndUser.find(params[:id])
    @coffees = @end_user.coffees
  end

  def withdrawal
    @end_user = EndUser.find(params[:end_user_id])
    @end_user.update(is_deleted: true)
    #reset_session
    redirect_to root_path
  end

  def favorites
    @end_user = EndUser.find(params[:id])
    favorites = Favorite.where(end_user_id: @end_user.id).pluck(:coffee_id)
    @favorite_coffees = Coffee.find(favorites)
  end

  def destroy
    @end_user = EndUser.find(params[:id])
    @end_user.destroy
    flash[:notice] = 'ユーザーを削除しました。'
    redirect_to :root #削除に成功すればrootページに戻る
  end
end
