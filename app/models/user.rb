class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  validates :username, :presence => true
  has_many :questions
  has_many :answers

  def self.can_vote?(user_id)
    user = User.find(user_id)
    karma = 0
    user.answers.each do |ans|
      karma += ans.rank
      return true if karma > 10
    end
    false if karma < 10
  end

  def self.karma(user_id)
    user = User.find(user_id)
    karma = 0
    user.answers.each do |ans|
      karma += ans.rank
    end
    user.questions.each do |que|
      karma += que.rank
    end
    
    karma
  end
end
