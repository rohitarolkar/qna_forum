class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.string :header
      t.integer :user_id
      t.integer :rank, :default => 0

      t.timestamps
    end
  end
end
