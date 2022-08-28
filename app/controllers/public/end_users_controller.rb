class Public::EndUsersController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_correct_end_user, { only: [:edit, :update, :destroy] }

  def index
  end

  def show
    @end_user = EndUser.find(params[:id])
    @coffees = @end_user.coffees.page(params[:page]).per(10)
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
    @end_user = EndUser.find(params[:id])
    if @end_user.update(end_user_params)
      redirect_to public_end_user_path
    else
      render :edit
    end
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

  def ensure_correct_end_user
    @end_user = EndUser.find(params[:id])
    return unless @end_user.id != current_end_user.id
    redirect_to public_end_user_path
  end
end
