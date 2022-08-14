class Admin::EndUsersController < ApplicationController
  def show
    @end_user = EndUser.find(params[:id])
    @coffees = @end_user.coffees
  end
end
