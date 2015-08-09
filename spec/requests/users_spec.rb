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

  it 'give the users that match with a user' do
    user1 = create(:user)
    user2 = create(:user)
    skill1 = create(:skill)
    skill2 = create(:skill)

    create(:skill_user, user: user1, skill: skill2, kind: SkillUser::ACQUIRED)
    create(:skill_user, user: user1, skill: skill1, kind: SkillUser::SEARCHED)
    create(:skill_user, user: user2, skill: skill1, kind: SkillUser::ACQUIRED)
    create(:skill_user, user: user2, skill: skill2, kind: SkillUser::SEARCHED)

    get "/api/v1/users/#{user1.id}/matches"

    expect(response).to be_success
    expect(response.body).to include user2.to_json
    expect(response.body).to_not include user1.to_json
  end
end
