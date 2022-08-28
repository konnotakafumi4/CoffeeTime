class SearchesController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_correct_end_user, only: [:seach]

  def search
    @range = params[:range]

    if @range == "ユーザー"
      @end_users = EndUser.looks(params[:word])
    else
      @coffees = Coffee.looks(params[:word]).page(params[:page]).per(10)
    end
  end
end
