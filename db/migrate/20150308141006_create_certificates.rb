class CreateCertificates < ActiveRecord::Migration
  def change
    create_table :certificates do |t|
      t.integer :applicant_id
      t.string :name
      t.integer :year
      t.string :grade

      t.timestamps null: false
    end
  end
end
