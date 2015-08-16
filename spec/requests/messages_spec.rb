require 'rails_helper'

describe "Messages API" do
  describe "GET #show" do
   it 'get the message' do
     message = create(:message)

     get "/api/v1/messages/#{message.id}"

    json = JSON.parse(response.body)
    expect(json['message']['body']).to eq message.body
   end
  end

  describe "POST #create" do
    it 'create the trail' do
      params = { body: 'Body' }

      post '/api/v1/messages', message: params

      expect(Message.count).to eq 1
    end
  end
end
