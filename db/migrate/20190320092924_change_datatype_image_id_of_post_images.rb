class ChangeDatatypeImageIdOfPostImages < ActiveRecord::Migration[5.2]
  def change
    # [形式] change_column(テーブル名, カラム名, データタイプ, オプション)
    change_column :post_images, :image_id, :text
  end
end
