class CreateLanguages < ActiveRecord::Migration
  def change
    create_table :languages do |t|
      t.integer :applicant_id
      t.string :language
      t.integer :spoken
      t.integer :written

      t.timestamps null: false
    end
  end
end
