class Public::CoffeesController < ApplicationController
  before_action :authenticate_end_user!
  before_action :ensure_correct_end_user, { only: [:edit, :update, :destroy] }

  def new
    @coffee = Coffee.new
  end

  def create
    @coffee = current_end_user.coffees.new(coffee_params)
    if @coffee.save
      redirect_to public_coffees_path
    else
      render action: :new
    end
  end

  def index
    @coffees = Coffee.page(params[:page]).per(10)
  end

  def time_line
    @coffee_all = Coffee.includes(:end_user)
    @end_user = EndUser.find(current_end_user.id)
    @follow_users = @end_user.followings
    @coffees_all = @coffee_all.where(end_user_id: @follow_users).order("created_at DESC").page(params[:page]).per(10)
  end

  def show
    @coffee = Coffee.find(params[:id])
    @coffee_comment = CoffeeComment.new
    @comments = @coffee.coffee_comments
  end

  def edit
    @coffee = Coffee.find(params[:id])
  end

  def update
    @coffee = Coffee.find(params[:id])
    if @coffee.update(coffee_params)
      redirect_to public_coffee_path
    else
      render :edit
    end
  end

  def destroy
    @coffee = Coffee.find(params[:id])
    @coffee.destroy
    redirect_to public_coffees_path
  end

  private

  def coffee_params
    params.require(:coffee).permit(:text, images: [])
  end

  def ensure_correct_end_user
    @coffee = Coffee.find_by(id: params[:id])
    return unless @coffee.end_user_id != current_end_user.id
    redirect_to public_coffee_path
  end
end
