FactoryGirl.define do
  factory :skill_user do
    user
    skill
    description 'description'
    kind SkillUser::SEARCHED
  end
end
