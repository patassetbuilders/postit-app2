class Post < ActiveRecord::Base
  include Votable
  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :categories, through:  :post_categories
  
  
  before_save :generate_slug
  
  validates :title, :description, presence: true 
  
  
  def generate_slug
    self.slug = self.title.gsub(' ','-').downcase
  end
  
  def to_param
    self.slug
  end
  
end