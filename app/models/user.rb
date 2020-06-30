class User < ApplicationRecord
  has_secure_password
  paginates_per 5

  before_save { self.email = email.downcase }

  has_many :articles, dependent: :destroy

  validates :username, presence: true, 
                       length: { minimum: 3, maximum: 25 },
                       uniqueness: { case_sensitive: false }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true,
                    length: { maximum: 50 },
                    uniqueness: { case_sensitive: false },
                    format: { with: VALID_EMAIL_REGEX }


  scope :admins, -> { where(admin: true) }
  
end