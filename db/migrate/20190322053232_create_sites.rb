class CreateSites < ActiveRecord::Migration[5.2]
  def change
    create_table :sites do |t|
      t.integer :sampleimage_id
      t.string :name
      t.text :address
      t.text :caption
      t.integer :postimage_id
      t.integer :user_id

      t.timestamps
    end
  end
end
