class Public::CoffeeCommentsController < ApplicationController
  def create
    @coffee = Coffee.find(params[:coffee_id])
    @comment = @coffee.coffee_comments.new(coffee_comment_params)
    @comment.end_user_id = current_end_user.id
    if @comment.save
      redirect_to request.referer
    else
      @coffee_new = Coffee.new
      @comments = @coffee.coffee_comments
      redirect_to new_post_path
    end
  end

  def destroy
    #@coffee = Coffee.find(params[:coffee_id])
    @comment = CoffeeComment.find(params[:id])
    @comment.destroy
    redirect_to request.referer
  end

  def coffee_comment_params
    params.require(:coffee_comment).permit(:comment)
  end
end
