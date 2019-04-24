class AddCommentToPostImage < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :comment, :text
  end
end
