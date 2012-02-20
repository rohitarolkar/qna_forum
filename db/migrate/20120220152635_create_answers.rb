class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.text :answer
      t.integer :rank, :default => 0
      t.integer :question_id
      t.integer :user_id

      t.timestamps
    end
  end
end
