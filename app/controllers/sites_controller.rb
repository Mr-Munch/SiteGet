class SitesController < ApplicationController

	before_action :authenticate_user!

	def show
		@site = Site.find(params[:id])

		site_image = PostImage.find_by(user_id: current_user.id, site_id: @site.id)

		if site_image.present?
			@post_image = site_image
		else
			@post_image = PostImage.new
		end

	end

	def index
		@post_images = PostImage.where(user_id: current_user.id)
		@sites = Site.all
	end
end
