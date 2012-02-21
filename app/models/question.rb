class Question < ActiveRecord::Base
  has_many :answers

  attr_accessible :question
  validates :question, :presence => true
end
