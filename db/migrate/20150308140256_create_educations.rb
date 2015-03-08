class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :applicant_id
      t.integer :level
      t.string :institution
      t.string :field
      t.string :grade
      t.string :awards
      t.string :location
      t.string :major
      t.integer :graduation_year, limit: 4

      t.timestamps null: false
    end
  end
end
