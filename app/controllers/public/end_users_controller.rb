class Public::EndUsersController < ApplicationController
  def index
  end

  def show
    @end_user = current_end_user
  end

  def edit
    @end_user = EndUser.find(params[:id])
  end

  def update
  end_user = EndUser.find(params[:id])
  end_user.update(end_user_params)
  redirect_to public_end_user_path
  end

  private
  def end_user_params
    params.require(:end_user).permit(:name, :introduction, :end_user_image)
  end
end
