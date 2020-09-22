class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :set_locale

  private

  def logged_in_user
    return if logged_in?

    store_location
    flash[:danger] = t "global.please_login"
    redirect_to login_url
  end

  def find_user
    @user = User.find_by id: params[:user_id]
    return if @user

    flash[:danger] = t "global.user_error"
    redirect_to root_url
  end

  def set_locale
    I18n.locale = params[:locale] || I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end
end
