class AddSiteIdToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :site_id, :integer
  end
end
