class AddRegionToSites < ActiveRecord::Migration[5.2]
  def change
    add_column :sites, :region, :integer
  end
end
