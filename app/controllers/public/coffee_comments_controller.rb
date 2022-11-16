class Public::CoffeeCommentsController < ApplicationController
  before_action :authenticate_end_user!
  #検証ツールから削除対策
  before_action :ensure_user, only: [:destroy]

  def create
    @coffee = Coffee.find(params[:coffee_id])
    @comment = @coffee.coffee_comments.new(coffee_comment_params)
    @comment.end_user_id = current_end_user.id
    if @comment.save
       @comments = @coffee.coffee_comments
       #redirect_to request.referer
       render :create
    else
      flash[:alret] = "コメントに失敗しました。コメントを入力してください。"
      @coffee_new = Coffee.new
      @comments = @coffee.coffee_comments
      render :create
    end
  end

  def destroy
    #@coffee = Coffee.find(params[:coffee_id])
    @comment = CoffeeComment.find(params[:id])
    @comment.destroy
    @comments = @comment.coffee.coffee_comments
    render :destroy
    #coffee_comment: @coffee_comment, coffee: @coffee, comments: @comments) %>");
  end

  private

  def coffee_comment_params
    params.require(:coffee_comment).permit(:comment, images: [])
  end
end
