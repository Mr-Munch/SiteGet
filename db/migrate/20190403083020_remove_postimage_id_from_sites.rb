class RemovePostimageIdFromSites < ActiveRecord::Migration[5.2]
  def change
    remove_column :sites, :postimage_id, :integer
  end
end
