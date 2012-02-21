class Rank < ActiveRecord::Base
  belongs_to :rankable, :polymorphic => true

  def self.rank_me(resource,args,user_id)
    vote = resource.ranks.find_by_user_id(user_id)
    if vote.present?
      vote.destroy and resource.rank -= 1 if vote.vote == 1
      vote.destroy and resource.rank += 1 if vote.vote == 0
    else
      resource.ranks.create(:user_id => user_id, :vote => 1) and resource.rank += 1 if args[:vote_up]
      resource.ranks.create(:user_id => user_id, :vote => 0) and resource.rank -= 1 if args[:vote_down]
    end
    resource.save
    resource
  end
end
