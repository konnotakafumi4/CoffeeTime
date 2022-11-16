class Admin::CoffeeCommentsController < ApplicationController
  before_action :authenticate_admin!
  
  def destroy
    @comment = CoffeeComment.find(params[:id])
    @comment.destroy
    @comments = @comment.coffee.coffee_comments
    render :destroy
  end

  private

  def coffee_comment_params
    params.require(:coffee_comment).permit(:comment, images: [])
  end
end
