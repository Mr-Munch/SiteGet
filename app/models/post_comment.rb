class PostComment < ApplicationRecord
	belongs_to :user, optional: true
	belongs_to :post_image, optional: true
end
