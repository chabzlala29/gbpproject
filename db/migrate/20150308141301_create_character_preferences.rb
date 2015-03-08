class CreateCharacterPreferences < ActiveRecord::Migration
  def change
    create_table :character_preferences do |t|
      t.integer :applicant_id
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.integer :number_of_years
      t.string :address
      t.string :contact
      t.string :company
      t.string :position

      t.timestamps null: false
    end
  end
end
