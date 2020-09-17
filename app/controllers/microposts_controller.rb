class MicropostsController < ApplicationController
  before_action :logged_in_user, only: %i(create destroy)
  before_action :correct_user, only: :destroy

  def create
    @micropost = current_user.microposts.build micropost_params
    @micropost.image.attach params[:micropost][:image]
    save_micro
  end

  def destroy
    if @micropost.destroy
      flash[:success] = t "global.micro_delete"
    else
      flash.now[:danger] = t "global.micro_delete_error"
    end
    redirect_to request.referer || root_url
  end

  private

  def save_micro
    if @micropost.save
      flash[:success] = t "global.micro_create"
      redirect_to root_url
    else
      flash.now[:danger] = t "global.create_failed"
      @feed_items = current_user.feed.order_created_at.page(params[:page])
                                .per Settings.microposts_controller.page
      render "static_pages/home"
    end
  end

  def micropost_params
    params.require(:micropost).permit Micropost::MICROPOST_PERMIT
  end

  def correct_user
    @micropost = current_user.microposts.find_by id: params[:id]
    redirect_to root_url unless @micropost
  end
end
