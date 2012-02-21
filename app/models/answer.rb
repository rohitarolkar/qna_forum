class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :ranks, :as => :rankable

  attr_accessible :answer
  validates :answer, :presence => true
end
