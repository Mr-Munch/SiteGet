class PostImage < ApplicationRecord
	belongs_to :user, optional: true

	attachment :image

	belongs_to :site, optional: true

	validates :image, presence: true

	has_many :post_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy

	def favorited_by?(user)
    	favorites.where(user_id: user.id).exists?
    end

end
