class UpdateArticleTimestamps < ActiveRecord::Migration[6.0]
  def change
    change_column :articles, :created_at, :datetime, precision: 6, null: false
    change_column :articles, :updated_at, :datetime, precision: 6, null: false
  end
end
