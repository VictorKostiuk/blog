class AddPostsCountToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :posts_count, :integer, null: false, default: 0
  end
end
