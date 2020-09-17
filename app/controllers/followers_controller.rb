class FollowersController < ApplicationController
  before_action :find_user, :logged_in_user

  def index
    @title = t "global.followers"
    @users = @user.followers.page(params[:page]).per Settings.paging.size
    render "users/show_follow"
  end
end
