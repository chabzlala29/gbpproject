class CreateSkills < ActiveRecord::Migration
  def change
    create_table :skills do |t|
      t.integer :applicant_id
      t.string :skill
      t.integer :years_of_experience
      t.integer :proficiency

      t.timestamps null: false
    end
  end
end
