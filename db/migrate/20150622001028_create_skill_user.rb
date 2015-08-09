class CreateSkillUser < ActiveRecord::Migration
  def change
    create_table :skill_users do |t|
      t.integer :skill_id
      t.integer :user_id
      t.string :description
      t.integer :kind
    end

    add_index :skill_users, :skill_id
    add_index :skill_users, :user_id
  end
end
