class PostCategory < ActiveRecord::Base
  belongs_to :posts
  belongs_to :categories
end