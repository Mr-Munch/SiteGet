class RelationshipsController < ApplicationController

  before_action :set_post_image
  before_action :set_user

  def create
  	follow = current_user.active_relationships.build(follower_id: params[:user_id])
    follow.save
    @post_image.reload
    @user.reload
  end

  def destroy
  	follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    @post_image.reload
    @user.reload
  end


   private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_post_image
    @post_image = PostImage.find_by(user_id: params[:user_id])
  end

end
