class HomeController < ApplicationController
  def index
    if logged_in?
      user_ids = current_user.liked_other_user_ids
      user_ids << current_user.id
      @user = User.where.not(id: user_ids).first
    end
  end
end
