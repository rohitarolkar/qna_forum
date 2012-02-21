class Answer < ActiveRecord::Base
  belongs_to :question

  attr_accessible :answer
  validates :answer, :presence => true
end
