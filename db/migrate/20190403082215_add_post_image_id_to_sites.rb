class AddPostImageIdToSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :post_image_id, :integer
  end
end
