# == Schema Information
#
# Table name: article_categories
#
#  id          :integer          not null, primary key
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  article_id  :integer
#  category_id :integer
#
# Indexes
#
#  index_article_categories_on_article_id   (article_id)
#  index_article_categories_on_category_id  (category_id)
#

class ArticleCategory < ApplicationRecord

  belongs_to :article
  belongs_to :category

end
