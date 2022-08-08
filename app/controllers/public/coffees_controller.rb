class Public::CoffeesController < ApplicationController
  def new
    @coffee = Coffee.new
  end

  def create
    coffee = current_end_user.coffees.new(coffee_params)
    coffee.save
    redirect_to public_coffees_path
  end

  def index
    @coffees = Coffee.all
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
    coffee = Coffee.find(params[:id])
    coffee.update(coffee_params)
    redirect_to public_coffee_path
  end

  def destroy
    @coffee = Coffee.find(params[:id])
    @coffee.destroy
    redirect_to public_coffees_path
  end

  private

  def coffee_params
    params.require(:coffee).permit(:image, :text)
  end
end
