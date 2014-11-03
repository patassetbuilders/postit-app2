class Category < ActiveRecord::Base
  has_many :post_categories
  has_many :posts, through: :posts_categories
  validates :name, presence: true, uniqueness: { case_sensitive: false }
end