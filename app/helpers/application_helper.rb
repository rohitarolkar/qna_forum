module ApplicationHelper
  def user_name(user_id)
    user ||= User.find_by_id(user_id)
    user.username
  end

  def user_karma(user_id)
    karma ||= User.karma(user_id)
  end
end
