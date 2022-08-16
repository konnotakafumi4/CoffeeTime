class Admin::CoffeesController < ApplicationController
  def index
    @coffees = Coffee.all
  end

  def show
    @coffee = Coffee.find(params[:id])
    @coffee_comment = CoffeeComment.new
    @comments = @coffee.coffee_comments
  end

  def destroy
    @coffee = Coffee.find(params[:id])
    @coffee.destroy
    redirect_to admin_coffees_path
  end
end
