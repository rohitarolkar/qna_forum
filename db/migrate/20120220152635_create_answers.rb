class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer
      t.integer :question_id
      t.integer :user_id
      t.integer :rank, :default => 0

      t.timestamps
    end
  end
end
