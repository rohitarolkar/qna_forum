class Answer < ActiveRecord::Base
  belongs_to :question
  has_many :ranks, :as => :rankable
  belongs_to :user

  attr_accessible :answer
  validates :answer, :presence => true

  def self.fetch_new_posts(ans_id)
    ans ||= Answer.last
    if ans.id > ans_id.to_i
      Answer.limit(6)
    end
  end
end
