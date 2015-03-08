class CreateJobPreferences < ActiveRecord::Migration
  def change
    create_table :job_preferences do |t|
      t.integer :applicant_id
      t.string :first_pref
      t.string :second_pref
      t.string :third_pref
      t.string :source
      t.string :firstname
      t.string :lastname

      t.timestamps null: false
    end
  end
end
