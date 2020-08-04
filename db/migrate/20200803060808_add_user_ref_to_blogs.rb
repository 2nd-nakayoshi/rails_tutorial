class AddUserRefToBlogs < ActiveRecord::Migration[5.2]
  def change
    add_reference :blogs, :user, foreign_key: true
    add_index :blogs, [:user_id, :created_at]
  end
end
