class Rank < ActiveRecord::Base
  belongs_to :rankable, :polymorphic => true

  def self.rank_me(resource,args,user_id)
    vote = resource.ranks.find_by_user_id(user_id)
    if vote.present?     
      vote.destroy and resource.rank -= 1 if vote.vote == 1 && ( args[:vote_down] && User.can_vote?) || args[:vote_up]
      vote.destroy and resource.rank += 1 if vote.vote == 0  && User.can_vote?
    else
      resource.ranks.create(:user_id => user_id, :vote => 1) and resource.rank += 1 if args[:vote_up]
      if args[:vote_down] && User.can_vote?(user_id)
	      resource.ranks.create(:user_id => user_id, :vote => 0) 
	      resource.rank -= 1	      
      end
    end
    resource.save
    resource
  end
end
