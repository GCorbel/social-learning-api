require 'rails_helper'

describe "Users API" do
  it 'sends a list of users' do
    2.times { create(:user) }

    get '/api/v1/users'

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json['users'].length).to eq 2
  end

  it 'give information about a single user' do
    user = create(:user)
    get "/api/v1/users/#{user.id}"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json['user']['nickname']).to eq user.nickname
  end

  it 'give information about a single user' do
    post "/api/v1/users/", user: attributes_for(:user)

    expect(response).to be_success
    expect(User.count).to eq 1
  end

  it 'update acquired skills' do
    user = create(:user)
    skill = create(:skill)

    put "/api/v1/users/#{user.id}/update_acquired_skills",
      acquired_skill_ids: [skill.id]

    expect(response).to be_success
    expect(user.acquired_skills).to include skill
  end

  it 'update searched skills' do
    user = create(:user)
    skill = create(:skill)

    put "/api/v1/users/#{user.id}/update_searched_skills",
      searched_skill_ids: [skill.id]

    expect(response).to be_success
    expect(user.searched_skills).to include skill
  end

  it 'give the users that match with a user' do
    user1 = create(:user)
    user2 = create(:user)
    skill1 = create(:skill)
    skill2 = create(:skill)
    user1.acquired_skills << skill2
    user1.searched_skills << skill1
    user2.acquired_skills << skill1
    user2.searched_skills << skill2

    get "/api/v1/users/#{user1.id}/matches"

    expect(response).to be_success
    expect(response.body).to include user2.to_json
    expect(response.body).to_not include user1.to_json
  end
end
