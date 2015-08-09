require 'rails_helper'

describe UserMatcher do
  describe '#call' do
    it 'match users' do
      user1 = create(:user)
      user2 = create(:user)
      skill1 = create(:skill)
      skill2 = create(:skill)

      create(:skill_user, user: user1, skill: skill1, kind: SkillUser::ACQUIRED)
      create(:skill_user, user: user1, skill: skill2, kind: SkillUser::SEARCHED)
      create(:skill_user, user: user2, skill: skill1, kind: SkillUser::SEARCHED)
      create(:skill_user, user: user2, skill: skill2, kind: SkillUser::ACQUIRED)

      matcher = UserMatcher.new(user: user1)

      expect(matcher.call).to eq [user2]
    end

    it "do'nt give the users who only searched acquired skills" do
      user1 = create(:user)
      user2 = create(:user)
      skill = create(:skill)

      create(:skill_user, user: user1, skill: skill, kind: SkillUser::SEARCHED)
      create(:skill_user, user: user2, skill: skill, kind: SkillUser::ACQUIRED)

      matcher = UserMatcher.new(user: user1)
      expect(matcher.call).to eq []
    end

    it "do'nt give the users who only acquired searched skills" do
      user1 = create(:user)
      user2 = create(:user)
      skill = create(:skill)

      create(:skill_user, user: user1, skill: skill, kind: SkillUser::ACQUIRED)
      create(:skill_user, user: user2, skill: skill, kind: SkillUser::SEARCHED)

      matcher = UserMatcher.new(user: user1)
      expect(matcher.call).to eq []
    end
  end
end
