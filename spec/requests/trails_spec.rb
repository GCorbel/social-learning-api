require 'rails_helper'

describe "Trails API" do

  describe "GET #show" do
    it 'get the trail' do
      trail = create(:trail)

      get "/api/v1/trails/#{trail.id}"

      json = JSON.parse(response.body)
      expect(json['trail']['id']).to eq trail.id
    end
  end

  describe "POST #create" do
    it 'create the trail' do
      user = create(:user)
      params = { user_ids: "1" }

      post '/api/v1/trails', trail: params

      expect(Trail.count).to eq 1
      expect(Trail.first.users).to eq [user]
    end
  end

  describe "PUT #update" do
    it 'update a skill' do
      trail = create(:trail)
      user = create(:user)
      params = { user_ids: "1" }

      put "/api/v1/trails/#{trail.id}", trail: params

      expect(Trail.first.users).to eq [user]
    end
  end
end
