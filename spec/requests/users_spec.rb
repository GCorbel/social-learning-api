require 'rails_helper'

describe "Users API" do
  it 'sends a list of users' do
    2.times { create(:user) }

    get '/api/v1/users'

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json.length).to eq 2
  end

  it 'give information about a single user' do
    user = create(:user)
    get "/api/v1/users/#{user.id}"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json['nickname']).to eq user.nickname
  end
end
