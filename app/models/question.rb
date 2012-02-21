class Question < ActiveRecord::Base
  has_many :answers
  has_many :ranks, :as => :rankable
  belongs_to :user
  attr_accessible :question
  validates :question, :presence => true
end
