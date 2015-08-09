require 'rails_helper'

describe 'Acquired skills API' do
  describe 'GET #index' do
    it 'list the skills with a user_id' do
      user = create(:user)
      create(:skill_user, user: user, kind: SkillUser::SEARCHED)
      get '/api/v1/skill_users', user_id: user.id, kind: SkillUser::SEARCHED

      json = JSON.parse(response.body)
      expect(json['skill_users'].length).to eq 1
    end

    it 'list the skills with a skill_id' do
      skill = create(:skill)
      create(:skill_user, skill: skill, kind: SkillUser::SEARCHED)
      get '/api/v1/skill_users', skill_id: skill.id, kind: SkillUser::SEARCHED

      json = JSON.parse(response.body)
      expect(json['skill_users'].length).to eq 1
    end
  end

  describe 'GET #show' do
    it 'get the skill' do
      skill_user = create(:skill_user, kind: SkillUser::SEARCHED)
      get "/api/v1/skill_users/#{skill_user.id}"

      json = JSON.parse(response.body)
      expect(json['skill_user']['kind']).to eq SkillUser::SEARCHED
      expect(json['skill_user']['user']).to eq skill_user.user_id
    end
  end

  describe 'POST #create' do
    it 'create the skill' do
      user = create(:user)
      skill = create(:skill)
      params = { kind: SkillUser::SEARCHED, description: 'desc',
                 user_id: user.id, skill_id: skill.id }
      post '/api/v1/skill_users', skillUser: params

      expect(SkillUser.count).to eq 1
    end
  end

  describe 'PUT #update' do
    it 'update a skill' do
      skill_user = create(:skill_user)

      params = { description: 'New Description' }
      put "/api/v1/skill_users/#{skill_user.id}/", skillUser: params

      new_description = SkillUser.find(skill_user.id).description
      expect(new_description).to eq 'New Description'
    end
  end

  describe 'DELETE #destroy' do
    it 'delete a skill' do
      skill_user = create(:skill_user)
      delete "/api/v1/skill_users/#{skill_user.id}"
      expect(SkillUser.count).to eq 0
    end
  end
end
