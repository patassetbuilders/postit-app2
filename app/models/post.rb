class Post < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :post_categories
  has_many :categories, through:  :post_categories
  has_many :votes, as: :voteable
  
  before_save :generate_slug
  
  validates :title, :description, presence: true 
  
  def total_votes
    self.votes.size 
  end
  
  def up_votes
    self.votes.where(vote: true).size
  end 
  
  def down_votes
    self.votes.where(vote: false).size
  end
  
  def generate_slug
    self.slug = self.title.gsub(' ','-').downcase
  end
  
  def to_param
    self.slug
  end
  
end