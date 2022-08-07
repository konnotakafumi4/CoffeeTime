class Public::CoffeesController < ApplicationController
  def new
    @coffee = Coffee.new
  end

  def create
    coffee = current_end_user.coffees.new(coffee_params)
    byebug
    coffee.save
    redirect_to public_coffees_path
  end

  def index
    @coffees = Coffee.all
  end

  def show
    @coffee = Coffee.find(params[:id])
  end

  private

  def coffee_params
    params.require(:coffee).permit(:image, :text)
  end
end
