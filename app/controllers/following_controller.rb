class FollowingController < ApplicationController
  before_action :find_user, :logged_in_user

  def index
    @title = t "global.following"
    @users = @user.following.page(params[:page]).per Settings.paging.size
    render "users/show_follow"
  end
end
