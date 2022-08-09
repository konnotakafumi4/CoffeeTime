class SearchesController < ApplicationController
  before_action :authenticate_end_user!
  def search
    @range = params[:range]

    if @range == "EndUser"
      @end_users = EndUser.looks(params[:word])
    else
      @coffees = Coffee.looks(params[:word])
    end
  end
end
