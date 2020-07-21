# == Schema Information
#
# Table name: articles
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  title       :string
#  descripton  :string
#
# Indexes
#
#  index_article_categories_on_article_id   (article_id)
#  index_article_categories_on_category_id  (category_id)
#
class Article < ApplicationRecord
  # paginates_per 10
  
  belongs_to :user
  has_many :article_categories
  has_many :categories, through: :article_categories
  
  validates :title, presence: true
  validates :description, presence: true
end