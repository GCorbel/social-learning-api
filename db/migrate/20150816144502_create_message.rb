class CreateMessage < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.integer :trail_id
      t.timestamps
    end
  end
end
