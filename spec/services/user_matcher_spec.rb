require 'rails_helper'

describe UserMatcher do
  describe '#call' do
    it 'match users' do
      user1 = create(:user)
      user2 = create(:user)
      skill1 = create(:skill)
      skill2 = create(:skill)
      user1.acquired_skills << skill2
      user1.searched_skills << skill1
      user2.acquired_skills << skill1
      user2.searched_skills << skill2

      matcher = UserMatcher.new(user: user1)
      expect(matcher.call).to eq [user2]
    end

    it "do'nt give the users who only searched acquired skills" do
      user1 = create(:user)
      user2 = create(:user)
      skill = create(:skill)
      user1.searched_skills << skill
      user2.acquired_skills << skill

      matcher = UserMatcher.new(user: user1)
      expect(matcher.call).to eq []
    end

    it "do'nt give the users who only acquired searched skills" do
      user1 = create(:user)
      user2 = create(:user)
      skill = create(:skill)
      user1.acquired_skills << skill
      user2.searched_skills << skill

      matcher = UserMatcher.new(user: user1)
      expect(matcher.call).to eq []
    end
  end
end
