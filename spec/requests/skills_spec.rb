require 'rails_helper'

describe "Skills API" do
  it 'sends a list of skills' do
    2.times { create(:skill) }

    get '/api/v1/skills'

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json['skills'].length).to eq 2
  end

  it 'search a list of skills' do
    create(:skill, name: 'Ember')
    create(:skill, name: 'Rails')

    get '/api/v1/skills?search=rails'

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json['skills'].length).to eq 1
    expect(json['skills'].first['name']).to eq 'Rails'
  end

  it 'give information about a single skill' do
    skill = create(:skill)
    get "/api/v1/skills/#{skill.id}"

    expect(response).to be_success

    json = JSON.parse(response.body)
    expect(json['skills']['name']).to eq skill.name
  end
end
