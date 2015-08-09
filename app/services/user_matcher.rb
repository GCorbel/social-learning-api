class UserMatcher
  attr_accessor :user

  def initialize(user:)
    @user = user
  end

  def call
    ids = acquired_ids & searched_ids
    User.where(id: ids)
  end

  private

  def acquired_skill_ids
    SkillUser.where(user: user).where(kind: SkillUser::ACQUIRED).
      pluck(:skill_id)
  end

  def searched_skill_ids
    SkillUser.where(user: user).where(kind: SkillUser::SEARCHED).
      pluck(:skill_id)
  end

  def acquired_ids
    SkillUser.where(skill_id: searched_skill_ids)
      .where(kind: SkillUser::ACQUIRED)
      .pluck(:user_id)
  end

  def searched_ids
    SkillUser.where(skill_id: acquired_skill_ids)
      .where(kind: SkillUser::SEARCHED)
      .pluck(:user_id)
  end
end
