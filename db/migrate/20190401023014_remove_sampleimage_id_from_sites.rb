class RemoveSampleimageIdFromSites < ActiveRecord::Migration[5.2]
  def change
    remove_column :sites, :sampleimage_id, :text
  end
end
