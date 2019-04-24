class RemovePostImageIdFromSites < ActiveRecord::Migration[5.2]
  def change
    remove_column :sites, :post_image_id, :integer
  end
end
