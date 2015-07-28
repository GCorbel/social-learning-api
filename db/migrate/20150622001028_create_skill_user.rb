class CreateSkillUser < ActiveRecord::Migration
  def change
    create_table :acquired_skills do |t|
      t.integer :skill_id
      t.integer :user_id
    end

    create_table :searched_skills do |t|
      t.integer :skill_id
      t.integer :user_id
    end

    add_index :acquired_skills, :skill_id
    add_index :acquired_skills, :user_id

    add_index :searched_skills, :skill_id
    add_index :searched_skills, :user_id
  end
end
