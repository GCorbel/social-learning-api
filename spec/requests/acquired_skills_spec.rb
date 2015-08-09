require 'rails_helper'

describe 'Acquired skills API' do
  it 'list the acquired skills' do
    user = create(:user)
    skill = create(:skill)
    user.acquired_skills << skill
    get '/api/v1/acquired_skills', user_id: user.id

    json = JSON.parse(response.body)
    expect(json['acquired_skills'].length).to eq 1
  end

  it 'create a new acquired skill' do
    user = create(:user)
    skill = create(:skill)
    params = { description: 'desc', user_id: user.id, skill_id: skill.id }
    post '/api/v1/acquired_skills', acquiredSkill: params

    expect(AcquiredSkill.count).to eq 1
  end

  it 'update a acquired skill' do
    acquired_skill = create(:acquired_skill)

    params = { description: 'New Description' }
    put "/api/v1/acquired_skills/#{acquired_skill.id}/", acquiredSkill: params

    new_description = AcquiredSkill.find(acquired_skill.id).description
    expect(new_description).to eq 'New Description'
  end

  it 'delete a acquired skill' do
    acquired_skill = create(:acquired_skill)
    delete "/api/v1/acquired_skills/#{acquired_skill.id}"
    expect(AcquiredSkill.count).to eq 0
  end
end
