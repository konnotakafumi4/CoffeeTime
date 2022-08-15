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
    reset_session
    redirect_to root_path
  end
end
