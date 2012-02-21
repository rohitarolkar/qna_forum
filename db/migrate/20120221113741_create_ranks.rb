class CreateRanks < ActiveRecord::Migration
  def change
    create_table :ranks do |t|
      t.integer :user_id
      t.integer :rankable_id
      t.string :rankable_type
      t.integer :vote

      t.timestamps
    end
  end
end
