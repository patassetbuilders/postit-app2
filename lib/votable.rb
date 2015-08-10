#=============================================================================
# Meta Programming using Rails Concers see below for traditional ruby methods
#=============================================================================

# replaced by votable_pat gem woohoo
#module Votable
#  extend ActiveSupport::Concern
#  
#  included do #methods in this block fires when the module is run
#    has_many :votes, as: :voteable
#  end
#  
#  def total_votes
#    self.votes.size 
#  end
#
#  def up_votes
#    self.votes.where(vote: true).size
#  end 
#
#  def down_votes
#    self.votes.where(vote: false).size
#  end
#  
#end
 

#=====================================================
# This is the traditional ruby meta programming method
#======================================================
#module Votable
#  def self.included(base)
#    base.send(:include, InstanceMethods)
#    base.extend ClassMethods
#    base.class_eval do #these lines actually call the class methods
#      my_class_method
#    end
#  end
#  
#  module InstanceMethods
#    
#    def total_votes
#      self.votes.size 
#    end
#  
#    def up_votes
#      self.votes.where(vote: true).size
#    end 
#  
#    def down_votes
#      self.votes.where(vote: false).size
#    end
#  
#  end
#  
#  module ClassMethods
#    def my_class_method
#      has_many :votes, as: :voteable
#    end
#  end
#
#end