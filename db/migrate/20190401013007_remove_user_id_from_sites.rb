class RemoveUserIdFromSites < ActiveRecord::Migration[5.2]
  def change
    remove_column :sites, :user_id, :integer
  end
end
