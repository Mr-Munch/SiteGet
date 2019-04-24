class UsersController < ApplicationController

	before_action :authenticate_user!

  def index
  	@users = User.all
  	@post_images = PostImage.all
  	@site = Site.all
    @heart_ranks = PostImage.find(Favorite.group(:post_image_id).order('count(post_image_id) desc').limit(3).pluck(:post_image_id))
    @site_ranks = Site.find(PostImage.group(:site_id).order('count(site_id) desc').limit(3).pluck(:site_id))

    @site_ranks_count = PostImage.group(:site_id).order('count(site_id) desc').limit(3).count

    # @site_ranks_two = Site.find(PostImage.group(:site_id).order('count(site_id) asc').limit(3).pluck(:site_id))
    @site_ranks_two = Site.find(Site.all.pluck(:id) - PostImage.all.pluck(:site_id)).sample(3)


    # site_ids = Site.all.pluck(:id)
    # pi_ids = PostImage.all.pluck(:site_id)
    # Site.find(site_ids - pi_ids).sample(3)

    # Site.find(Site.all.pluck(:id) - PostImage.all.pluck(:site_id)).sample(3)
  end

  def show
  	@user = User.find(params[:id])
  	@post_images = PostImage.where(user_id: @user.id).page(params[:page]).reverse_order
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    flash[:notice] = "ユーザ情報を変更しました"
    redirect_to user_path(@user.id)
  end

  def follows
    @user = User.find(params[:id])
    user = User.find(params[:id])
    @users = user.followings
  end

  def followers
    @user = User.find(params[:id])
    user = User.find(params[:id])
    @users = user.followers
  end

  private
    def user_params
      params.require(:user).permit(:name, :image)
    end
end
