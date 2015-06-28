FactoryGirl.define do
  factory :user do
    sequence :email do |n|
      "guirec.corbel#{n}@gmail.com"
    end
    nickname 'Dougui'
    bio "I'm a Rails developer"
    password 'test'
  end
end
