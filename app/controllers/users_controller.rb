class UsersController < ApplicationController
  before_action :logged_in_user, except: %i(show create new)
  before_action :find_user, except: %i(create new index)
  before_action :correct_user, only: %i(edit update)
  before_action :admin_user, only: :destroy

  def show; end

  def new
    @user = User.new
  end

  def index
    @users = User.page(params[:page]).per Settings.paging.size
  end

  def create
    @user = User.new user_params
    if @user.save
      log_in @user
      flash[:success] = t "global.text_success"
      redirect_to @user
    else
      flash.now[:danger] = t "global.text_error"
      render :new
    end
  end

  def edit; end

  def update
    if @user.update user_params
      flash[:success] = t "global.update_success"
      redirect_to @user
    else
      flash.now[:danger] = t "global.update_error"
      render :edit
    end
  end

  def destroy
    if @user.destroy
      flash[:success] = t "global.user_delete", user_name: @user.name
    else
      flash.now[:danger] = t "global.destroy_fail", user_name: @user.name
    end
    redirect_to users_url
  end

  private

  def user_params
    params.require(:user).permit User::USER_PERMIT
  end

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t "global.please_login"
    redirect_to login_url
  end

  def correct_user
    redirect_to root_url unless current_user? @user
  end

  def admin_user
    redirect_to root_url unless current_user.admin?
  end

  def find_user
    @user = User.find_by id: params[:id]
    return if @user

    flash[:danger] = t "global.not_found_user"
    redirect_to root_path
  end
end
