class Admin::RelationshipsController < ApplicationController
  def followings
    end_user = EndUser.find(params[:end_user_id])
    @end_users = end_user.followings
  end
  # フォロワー一覧
  def followers
    end_user = EndUser.find(params[:end_user_id])
    @end_users = end_user.followers
  end
end
