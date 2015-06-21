require 'rails_helper'

describe Skill do
  describe '#search' do
    context 'when the search is empty' do
      it 'give all records' do
        create(:skill, name: 'Rails')
        create(:skill, name: 'Ember')

        skills = Skill.search(nil)

        expect(skills.length).to eq 2
      end
    end

    context 'when there is a search' do
      it 'search by name' do
        create(:skill, name: 'Rails', description: 'Desc1')
        create(:skill, name: 'Ember', description: 'Desc2')

        skills = Skill.search('rail')

        expect(skills.length).to eq 1
        expect(skills.first.name).to eq 'Rails'
      end
    end

    context 'when there is a search' do
      it 'search by description' do
        create(:skill, name: 'Name1', description: 'Ruby')
        create(:skill, name: 'Name2', description: 'Javascript')

        skills = Skill.search('uby')

        expect(skills.length).to eq 1
        expect(skills.first.description).to eq 'Ruby'
      end
    end
  end
end
