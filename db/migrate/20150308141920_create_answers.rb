class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      t.integer :applicant_id
      t.integer :question_id
      t.boolean :answer
      t.text :explanation

      t.timestamps null: false
    end
  end
end
