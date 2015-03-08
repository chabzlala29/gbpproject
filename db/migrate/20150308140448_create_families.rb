class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer :applicant_id
      t.string :firstname
      t.string :middlename
      t.string :lastname
      t.integer :relationship
      t.string :address
      t.string :company
      t.date :dob
      t.string :position

      t.timestamps null: false
    end
  end
end
