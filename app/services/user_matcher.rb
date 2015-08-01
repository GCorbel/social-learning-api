class UserMatcher
  attr_accessor :user

  def initialize(user:)
    @user = user
  end

  def call
    acquired_ids = AcquiredSkill.where(skill_id: user.searched_skill_ids)
      .pluck(:user_id)
    searched_ids = SearchedSkill.where(skill_id: user.acquired_skill_ids)
      .pluck(:user_id)
    ids = acquired_ids & searched_ids
    User.where(id: ids)
  end
end
