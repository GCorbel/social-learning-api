require 'rails_helper'

describe 'Searched skills API' do
  it 'list the searched skills' do
    user = create(:user)
    skill = create(:skill)
    user.searched_skills << skill
    get '/api/v1/searched_skills', user_id: user.id

    json = JSON.parse(response.body)
    expect(json['searched_skills'].length).to eq 1
  end

  it 'create a new searched skill' do
    user = create(:user)
    skill = create(:skill)
    params = { description: 'desc', user_id: user.id, skill_id: skill.id }
    post '/api/v1/searched_skills', searchedSkill: params

    expect(SearchedSkill.count).to eq 1
  end

  it 'delete a searched skill' do
    searched_skill = create(:searched_skill)
    delete "/api/v1/searched_skills/#{searched_skill.id}"
    expect(SearchedSkill.count).to eq 0
  end
end
