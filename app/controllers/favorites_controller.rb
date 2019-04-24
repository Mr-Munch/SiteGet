class FavoritesController < ApplicationController

	before_action :set_post_image

	def create
		@favorite = Favorite.create(user_id: current_user.id, post_image_id: params[:post_image_id])
		@post_image.reload
	end

	def destroy
		favorite = Favorite.find_by(user_id: current_user.id, post_image_id: params[:post_image_id])
		favorite.destroy
		@post_image.reload
	end

	private
		def set_post_image
			@post_image = PostImage.find(params[:post_image_id])
		end
end
