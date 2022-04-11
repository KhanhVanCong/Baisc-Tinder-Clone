class RelationshipLikesController < ApplicationController
  before_action :logged_in_user

  def create
    @user = User.find(params[:liked_id])
    current_user.like(@user)
    redirect_to root_path
  end

  def destroy
    user = RelationshipLike.find(params[:id]).liked
    current_user.unlike(user)
    redirect_to root_path
  end
end
