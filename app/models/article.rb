class Article < ApplicationRecord
  paginates_per 10
  
  belongs_to :user
  
  validates :title, presence: true
  validates :description, presence: true
end