class CreateTrails < ActiveRecord::Migration
  def change
    create_table :trails do |t|
      t.timestamps
    end

    create_table :trails_users do |t|
      t.integer :user_id
      t.integer :trail_id
      t.timestamps
    end
  end
end
