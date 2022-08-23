class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_correct_end_user, only: [:edit, :update, :favorites, :destroy]

  def index
  end

  def show
    @end_user = EndUser.find(params[:id])
    @coffees = @end_user.coffees
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    end_user = EndUser.find(params[:id])
    end_user.update(end_user_params)
    redirect_to public_end_user_path
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

  private

  def end_user_params
    params.require(:end_user).permit(:name, :introduction, :end_user_image)
  end
end
