class AddUserIdtoArticles < ActiveRecord::Migration[6.0]
  def change
    remove_column :articles, :author
    add_reference :articles, :user, foreign_key: true, index: true
  end
end
