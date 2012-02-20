class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :question
      t.integer :rank, :default => 0
      t.integer :user_id

      t.timestamps
    end
  end
end
