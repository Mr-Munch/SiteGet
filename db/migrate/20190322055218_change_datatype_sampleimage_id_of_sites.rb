class ChangeDatatypeSampleimageIdOfSites < ActiveRecord::Migration[5.2]
  def change
  	change_column :sites, :sampleimage_id, :text
  end
end
