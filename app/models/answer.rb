class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :ranks, :as => :rankable
  belongs_to :user

  attr_accessible :answer
  validates :answer, :presence => true

  def self.fetch_new_posts(ans_id)
    Answer.where("id > #{ans_id}")
  end
end
