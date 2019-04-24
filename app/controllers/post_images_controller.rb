class PostImagesController < ApplicationController

	before_action :authenticate_user!


	def show
		@site = Site.find(params[:site_id])
		@post_image = PostImage.find_by(site_id: params[:site_id], id: params[:id])
		@post_comment = PostComment.new
	end

	def create
		post_image = PostImage.new(post_image_params)
		post_image.user_id = current_user.id
		post_image.site_id = params[:site_id]

		if post_image.save
			flash[:notice] = "写真を投稿しました"
			redirect_to site_post_image_path(post_image.site_id, post_image.id)
		else
			
		end
	end

	def update
		post_image = PostImage.find_by(id: params[:id], site_id: params[:site_id])
		post_image.update(post_image_params)
		redirect_to site_post_image_path(post_image.site_id, post_image.id)
	end

	def destroy
		post_image = PostImage.find(params[:id])
		post_image.destroy
		redirect_to  user_path(current_user.id)
	end

	private
		def post_image_params
			params.require(:post_image).permit(:comment, :image)
		end
end
