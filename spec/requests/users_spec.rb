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
    expect(json['users']['nickname']).to eq user.nickname
  end

  it 'give information about a single user' do
    post "/api/v1/users/", user: attributes_for(:user)

    expect(response).to be_success
    expect(User.count).to eq 1
  end
end
